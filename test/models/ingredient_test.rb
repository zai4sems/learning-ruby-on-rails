require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
   
   def setup
       @ingredient = Ingredient.new(ingredient_name: "tepung")
   end
    
    test "ingredient shoud be valid" do
        assert @ingredient.valid?
    end
    
    test "name should be present" do
        @ingredient.ingredient_name = " "
        assert_not @ingredient.valid?
    end
    
    test "name should be unique" do
        @ingredient.save
        ingredient2 = Ingredient.new(ingredient_name: "tepung")
        assert_not ingredient2.valid?
    end
    
    
end