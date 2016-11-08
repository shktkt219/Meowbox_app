class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :serial

      t.timestamps null: false
    end
  end
end
