class AddColumnToReplies < ActiveRecord::Migration
  def up
    create_table :replies do |t|
       t.belongs_to :user, index: true
       t.belongs_to :discussion , index: true
       t.string :reply_content , limit: 255 , null: false
    end
  end

  def up

  end
end
