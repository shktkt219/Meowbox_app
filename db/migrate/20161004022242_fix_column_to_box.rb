class FixColumnToBox < ActiveRecord::Migration
  def change
    change_column :boxes, :month_year, :date
  end
end
