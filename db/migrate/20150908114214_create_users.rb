class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
     t.string   :name,            limit: 40,  null: false
     t.string   :emailid,         limit: 40,  null: false
     t.string   :password_digest
     t.datetime :created_at
     t.datetime :updated_at
    end
  end

  def down
  	drop table :users
  end
end
