class Reply < ActiveRecord::Base
	has_many :discussions
	has_many :users
end
