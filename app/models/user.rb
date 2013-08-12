class User < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email,:password, :password_confirmation,:username
  	
    has_many :comments, :dependent => :destroy
  	has_secure_password

  	before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

  	validates_presence_of :first_name
  	validates_presence_of :last_name
  	validates_presence_of :email
  	validates_uniqueness_of :username, :email

  	validates :username, :length => { :in => 3..20 }
  	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true

  	validates_format_of :email, :with=>/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
  	
end
