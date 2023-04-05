class RemoveIndicesOnReviewsAndCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_index :cart_items, name: "index_cart_items_on_item_id"
    remove_index :cart_items, name: "index_cart_items_on_user_id"
    remove_index :reviews, name: "index_reviews_on_commenter_id"
    remove_index :reviews, name: "index_reviews_on_item_id"
  end
end
