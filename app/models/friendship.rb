class Friendship < ActiveRecord::Base
	  has_many :chats, dependent: :destroy
end
