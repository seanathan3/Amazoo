class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body
      t.references :commenter, foreign_key: {to_table: :users}, null: false, index: true
      t.references :item, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
