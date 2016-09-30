class CreateBoxItems < ActiveRecord::Migration
  def change
    create_table :box_items do |t|
      t.belongs_to :box, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
