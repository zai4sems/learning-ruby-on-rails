require 'test_helper'
    
class ListIngredientsTest < ActionDispatch::IntegrationTest
    

    def setup
        @ingredient = Ingredient.create(ingredient_name: "tepung")
        @ingredient2 = Ingredient.create(ingredient_name: "vanilla")
    end
    
    test "should show ingredients listing" do
        get ingredients_path
        assert_template 'ingredients/index'
        assert_select "a[href=?]", ingredient_path(@ingredient), text: @ingredient.ingredient_name
        assert_select "a[href=?]", ingredient_path(@ingredient2), text: @ingredient2.ingredient_name
    
    end
    
end