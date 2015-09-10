class CreateAttachments < ActiveRecord::Migration
  def up
    create_table :attachments do |t|
    t.belongs_to :post , index: true	
    t.string   :attachment_link, limit: 400
    t.datetime :created_at
    t.datetime :updated_at
    end
  end

  def down
  end
end
