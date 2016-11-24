class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :material_name
      t.decimal :purchase_price
      t.float :purchase_quantity
      t.decimal :price
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
