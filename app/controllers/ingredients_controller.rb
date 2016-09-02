class IngredientsController < ApplicationController
    
    def new
        @ingredient = Ingredient.new
    end
    
    def create
        @ingredient = Ingredient.new(ingredient_params)
        @ingredient.save
        redirect_to ingredients_show(@ingredient)
    end
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:ingredient_name, :purchase_price)
    end
    
end