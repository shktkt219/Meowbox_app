class FixColumnToItem < ActiveRecord::Migration
  def change
    rename_column :items, :title, :item_name
  end
end
