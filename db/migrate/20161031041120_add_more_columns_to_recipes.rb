class AddMoreColumnsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :rate_per_hour, :decimal
    add_column :recipes, :time_spent_in_hour, :float
    add_column :recipes, :percentage_profit, :integer
    add_column :recipes, :serving_number, :integer
  end
end
