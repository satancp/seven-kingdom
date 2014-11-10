class Commentstate < ActiveRecord::Base
	belongs_to :user
	belongs_to :info
end
