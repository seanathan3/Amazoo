class DropCartItems < ActiveRecord::Migration[7.0]
  def change
    drop_table :cart_items
  end
end
