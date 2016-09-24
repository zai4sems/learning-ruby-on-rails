class AddNeedToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :need, :float
  end
end
