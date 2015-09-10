class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.string :section_heading
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
  end
end
