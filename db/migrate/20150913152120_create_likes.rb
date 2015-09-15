class CreateLikes < ActiveRecord::Migration
  def up
    create_table :likes do |t|
      t.belongs_to :user, index: true	
      t.belongs_to :post, index:true
      t.timestamps null: false
    end
  end

  def down
  	drop_table :likes 
  end

end
