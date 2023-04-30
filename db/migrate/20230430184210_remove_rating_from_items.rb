class RemoveRatingFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :rating
  end
end
