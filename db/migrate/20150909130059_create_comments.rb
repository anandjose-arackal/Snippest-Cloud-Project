class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    t.belongs_to :user, index: true
    t.belongs_to :post, index: true
    t.string :comments_content, limit:255 
    t.datetime :created_at
    t.datetime :updated_at 
    end
  end

  def down
  end

end
