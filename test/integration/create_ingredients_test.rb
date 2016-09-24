require 'test_helper'
    
class CreateIngredientsTest < ActionDispatch::IntegrationTest
    
    test "get new ingredient form and create ingredient" do
        get new_ingredient_path
        assert_template 'ingredients/new'
        assert_difference 'Ingredient.count', 1 do
            post_via_redirect ingredients_path, ingredient: {ingredient_name: "tepung"}
        end
        assert_template 'ingredients/index'
        assert_match "tepung", response.body
    end
    
    test "invalid ingredient submission results in failure" do
        get new_ingredient_path
        assert_template 'ingredients/new'
        assert_no_difference 'Ingredient.count' do
            post ingredients_path, ingredient: {ingredient_name: " "}
        end
        assert_template 'ingredients/new'
        #assert_select 'h2.panel-title'
        #assert_select 'div.panel-body'
    end
    
end