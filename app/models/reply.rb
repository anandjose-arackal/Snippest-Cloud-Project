class Reply < ActiveRecord::Base
	has_many :discussions
	has_many :users
	belongs_to :discussion
end
