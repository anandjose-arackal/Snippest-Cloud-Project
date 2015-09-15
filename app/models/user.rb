class User < ActiveRecord::Base
	has_secure_password
	has_many :userdets
	has_many :posts 
	has_many :comments
	has_many :likes , dependent: :destroy

	def like!(post)
    self.likes.create!(post_id: post.id)
    end

# destroys a heart with matching post_id and user_id
    def unlike!(post)
     heart = self.likes.find_by_post_id(post.id)
     heart.destroy!
    end

# returns true of false if a post is hearted by user
    def like?(post)
     self.likes.find_by_post_id(post.id)
    end
end
