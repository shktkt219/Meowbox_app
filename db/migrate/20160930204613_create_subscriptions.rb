class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.float :price
      t.string :interval

      t.timestamps null: false
    end
  end
end
