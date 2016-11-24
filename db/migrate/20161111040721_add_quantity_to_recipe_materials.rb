class AddQuantityToRecipeMaterials < ActiveRecord::Migration
  def change
    add_column :recipe_materials, :quantity, :float
  end
end
