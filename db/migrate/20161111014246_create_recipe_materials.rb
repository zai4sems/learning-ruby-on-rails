class CreateRecipeMaterials < ActiveRecord::Migration
  def change
    create_table :recipe_materials do |t|
      t.integer :recipe_id
      t.integer :material_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
