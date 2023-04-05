class RenameType < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :type, :animal_type
  end
end
