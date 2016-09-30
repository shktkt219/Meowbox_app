class CreateUserBoxes < ActiveRecord::Migration
  def change
    create_table :user_boxes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :box, index: true, foreign_key:true

      t.timestamps null: false
    end
  end
end
