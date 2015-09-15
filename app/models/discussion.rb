class Discussion < ActiveRecord::Base
	belongs_to :user
	belongs_to :section
	has_many :attachments
	has_many :reply
end
