module ActsAsViewable
  extend ActiveSupport::Concern

  included do
  end
  
  module ClassMethods
    def acts_as_viewable(options = {})
      options = { :ttl => 60 }.merge(options)
      const_set('VIEW_TIME_TO_LIVE', options[:ttl])
      has_many :views, :as => :viewable, :class_name => ActsAsViewable::View, :dependent=>:destroy
      has_one :total_views, :conditions => { :viewable_type => self.name }, :as => :viewable, :class_name => 'ActsAsViewable::TotalViews'
      scope :most_viewed, lambda { |*args| { :include => :total_views, :order => '`total_views`.`views` DESC', :limit => args.first || 10 } }
    end
  end
    
  def viewable?
    true
  end
  
  def nb_views
    total_views && total_views.views || 0
  end
  
  def view!(ip)
    unless View.create(:viewable_id => id, :viewable_type => self.class.name, :ip => ip).new_record?
      if total_views
        total_views.increment!(:views)
      else
        create_total_views(:viewable_type => self.class.name, :views => 1)
      end
    end
  end
  
end

class ActiveRecord::Base
  include ActsAsViewable
end