class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :image, :string
    add_column :items, :size, :string
    add_column :items, :url, :string
  end
end
