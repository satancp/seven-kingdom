class Micropost < ActiveRecord::Base
      belongs_to :user    
      has_many :commentstatems
      has_and_belongs_to_many :tags
      validates :user_id, presence: true
      validates :content, presence: true, length: { maximum: 140 }
      default_scope -> {order('microposts.created_at DESC')}
    end