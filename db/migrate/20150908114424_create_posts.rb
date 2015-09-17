
class CreatePosts < ActiveRecord::Migration
  def up
   create_table :posts do |t|
    t.belongs_to :user, index: true
    t.string   :post_heading, limit: 255,  null: false
    t.text     :post_content
    t.string   :post_description, limit:255
    t.string   :post_tags,    limit: 45
    t.belongs_to :section ,index: true
    t.integer  :post_like,    limit: 4
    t.integer  :post_dislike, limit: 4
    t.datetime :created_at
    t.datetime :updated_at
    end
  end

  def down
  	drop_table :posts
  end
end
