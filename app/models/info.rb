class Info < ActiveRecord::Base
	belongs_to :user
	belongs_to :infotype
  has_many :commentstates
	has_many :comments, dependent: :destroy
    has_many :commentators, :through => :comments,
                    :source => :user
	default_scope -> {order('infos.created_at DESC')}
	def self.search(search)  
        if search
           where(['title LIKE ?', "%#{search}%"])  
        else  
           where(nil)
        end  
    end  
end
