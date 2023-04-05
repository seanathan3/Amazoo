class AddTypeToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :type, :string, null: false
  end
end
