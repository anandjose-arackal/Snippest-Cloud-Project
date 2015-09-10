class Comment < ActiveRecord::Base
	has_many :posts
	has_many :users
	belongs_to :post
end
