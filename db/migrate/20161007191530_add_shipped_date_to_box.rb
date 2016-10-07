class AddShippedDateToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :shipped_date, :datetime
  end
end
