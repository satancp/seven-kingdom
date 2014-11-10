class Infotype < ActiveRecord::Base
	has_many :infos
	has_many :users, through: :infos
end
