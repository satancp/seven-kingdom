class Comment < ActiveRecord::Base
	   belongs_to :user         
       belongs_to :info  
       validates :user_id, presence: true
       validates :info_id, presence: true
       validates :content, presence: true, length: { maximum: 140 }
       default_scope -> {order('comments.created_at DESC')}
end
