class RemoveCount < ActiveRecord::Migration
  def change
  	remove_column :posts , :post_like
  	remove_column :posts , :post_dislike
  end
end
