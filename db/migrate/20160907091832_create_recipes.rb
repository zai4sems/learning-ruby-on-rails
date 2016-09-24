class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.text :instructions
      t.decimal :cost
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
