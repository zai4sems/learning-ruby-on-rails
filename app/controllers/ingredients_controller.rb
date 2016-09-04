class IngredientsController < ApplicationController
    
    def new
        @ingredient = Ingredient.new
    end
    
    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            flash[:notice] = "Ingredient was successfully created"
            redirect_to ingredient_path(@ingredient)
        else
            render 'new'
        end
    end
    
    def show
        @ingredient = Ingredient.find(params[:id])
    end
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:ingredient_name, :purchase_price)
    end
    
end