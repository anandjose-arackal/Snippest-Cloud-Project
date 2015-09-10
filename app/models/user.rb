class User < ActiveRecord::Base
	has_secure_password
	has_one :userP
	has_many :posts
	has_many :comments
end
