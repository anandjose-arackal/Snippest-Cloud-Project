require 'elasticsearch/model'
class Post < ActiveRecord::Base
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	belongs_to :user
	belongs_to :section
	has_many :attachments
	has_many :comments
	has_many :likes , dependent: :destroy
end
Post.import
