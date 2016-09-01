class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name
      t.decimal :purchase_price
      t.float :volume
      t.string :unit
      t.decimal :price
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
