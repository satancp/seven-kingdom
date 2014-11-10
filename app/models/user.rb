 class User < ActiveRecord::Base
      has_many :friendships, dependent: :destroy
      has_many :commentstates
      has_many :commentstatems
 	    has_many :microposts, dependent: :destroy
      has_many :infos, dependent: :destroy
      has_many :loves, dependent: :destroy
      has_many :infotypes, through: :infos
      has_many :comments, dependent: :destroy
      has_many :commented_infos,
               :through => :comments, :source => :info
 	    before_save do |user| 
              user.email = email.downcase 
            user.remember_token = SecureRandom.urlsafe_base64
            end
      validates :name, presence: true, length: { in: 4..30 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true, 
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }

      has_secure_password
      has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
      validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
      has_attached_file :file_avatar,  :default_url => "/images/:style/missing.doc"
    end    