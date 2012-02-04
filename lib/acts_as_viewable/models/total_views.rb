module ActsAsViewable
  class TotalViews < ::ActiveRecord::Base
    belongs_to :viewable, :polymorphic => true
    validates_presence_of :viewable_id, :viewable_type, :views  
  end
end