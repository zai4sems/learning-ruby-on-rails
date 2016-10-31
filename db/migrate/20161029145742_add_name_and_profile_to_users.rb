class AddNameAndProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :hour_worked_per_week, :float 
    add_column :users, :no_of_week_holiday_per_year, :float 
    add_column :users, :overhead_per_hour, :decimal
  end
end
