class DropTable < ActiveRecord::Migration
  def change
    drop_table :user_recipes
  end
end
