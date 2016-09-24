require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase
    
    def setup
       @ingredient = Ingredient.create(ingredient_name: "tepung") 
    end
    
    test "should get ingredients index" do
        get :index
        assert_response :success
    end
    
    test "should get new" do
        get :new
        assert_response :success
    end

    test "should get show" do
        get(:show, {'id' => @ingredient.id})
        assert_response :success
    end


    
end