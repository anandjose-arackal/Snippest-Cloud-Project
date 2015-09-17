class CreateUserdets < ActiveRecord::Migration
  def up
    create_table :userdets do |t|
      t.belongs_to :user , index: true
      t.string   :user_experience, limit: 100
      t.string   :user_field_work, limit: 45
      t.integer  :user_rateing,      limit: 4
      t.string   :user_img_path,   limit: 100
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
  end
end
