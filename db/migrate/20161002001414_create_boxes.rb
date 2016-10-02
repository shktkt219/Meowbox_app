class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :title
      t.string :month_year
      t.integer :subscription_id

      t.timestamps null: false
    end
  end
end
