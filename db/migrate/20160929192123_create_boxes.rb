class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :title
      t.integer :level
      t.integer :year
      t.string :month

      t.timestamps null: false
    end
  end
end
