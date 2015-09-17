class CreateDiscussions < ActiveRecord::Migration
  def up
    #create_table :discussions do |t|
    #  t.belongs_to :user, index: true
    #  t.string :discussion_heading , limit: 255,  null: false
    #  t.text :discussion_content
    #  t.sting :discussion_tags ,limit:255
    #  t.belongs_to :section ,index: true
    #  t.datetime :created_at
    #  t.datetime :updated_at
    #end
  end

  def down
  	drop_table :discussions
  end
end
