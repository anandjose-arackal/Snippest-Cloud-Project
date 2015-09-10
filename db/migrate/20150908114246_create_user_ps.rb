class CreateUserPs < ActiveRecord::Migration
  def up
    create_table :user_ps do |t|
    t.belongs_to :user , index: true
    t.string   :p_users_experience, limit: 100
    t.string   :p_users_field_work, limit: 45
    t.integer  :p_users_rateing,      limit: 4
    t.string   :p_users_img_path,   limit: 100
    t.datetime :created_at
    t.datetime :updated_at 
    end
  end

  def down
  end
end
