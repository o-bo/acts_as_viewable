module ActsAsViewable
  class View < ::ActiveRecord::Base
    belongs_to :viewable, :polymorphic => true

    validates_presence_of :viewable_type, :viewable_id, :ip
    validate :ip_has_not_viewed_viewable_in_last_n_minutes, :if => :viewable_type
    
    private

      def ip_has_not_viewed_viewable_in_last_n_minutes
        # time_ago = (viewable_type.camelcase.constantize::VIEW_TIME_TO_LIVE || 0).minutes.ago
        # views = View.all
        # views.each do |v|
        #   puts "MAX DELAY #{time_ago}"
        #   puts "NOW #{Time.now.utc}"
        #   puts "VU PAR : #{v.ip} | #{v.viewable_id} | #{v.viewable_type} A #{v.created_at}"
        #   puts "#{v.created_at === (time_ago..Time.now)}"
        #   puts "LE MEME" if (v.ip==ip && v.viewable_type == viewable_type && v.viewable_id == viewable_id && v.created_at === (time_ago...Time.now.utc))
        # end
        errors.add(:ip, 'has viewed this viewable too recently') unless View.count(:conditions => {
          :ip => ip,
          :viewable_id => viewable_id,
          :viewable_type => viewable_type,
          :created_at => time_ago..Time.now.utc
        }).zero?
      end
  end
end