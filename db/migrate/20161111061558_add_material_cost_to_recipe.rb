class AddMaterialCostToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :material_cost, :decimal
  end
end
