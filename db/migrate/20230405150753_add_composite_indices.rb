class AddCompositeIndices < ActiveRecord::Migration[7.0]
  def change
    add_index :cart_items, [:user_id, :item_id], unique: true
    add_index :reviews, [:commenter_id, :item_id], unique: true
  end
end
