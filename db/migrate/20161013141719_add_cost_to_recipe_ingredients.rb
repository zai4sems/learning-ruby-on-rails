class AddCostToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :cost, :decimal
  end
end
