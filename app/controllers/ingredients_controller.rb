class IngredientsController < ApplicationController
    
    before_action :set_ingredient, only: [:edit, :update, :show, :destroy]
   
    
    def index
       @ingredients = Ingredient.all 
    end
    
    def new
        @ingredient = Ingredient.new
    end
    
    def edit
    end
    
    def create
        @ingredient = Ingredient.new(ingredient_params)
        @ingredient.price = @ingredient.calculate_price_per_unit
        if @ingredient.save
            flash[:notice] = "Ingredient was successfully created"
            redirect_to ingredient_path(@ingredient)
        else
            render 'new'
        end
    end
    
    def update
       @ingredient.price = @ingredient.calculate_price_per_unit
       if @ingredient.update(ingredient_params)
           flash[:notice] = "Ingredient was successfully updated"
           redirect_to ingredient_path(@ingredient)
       else
           render 'edit'
       end
    end
    
    def show
        @ingredient.price = @ingredient.calculate_price_per_unit
    end
    
    def destroy
        @ingredient.destroy
        flash[:notice] = "Ingredient was successfully deleted"
        redirect_to ingredients_path
    end
    
    private
    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end
    
    def ingredient_params
        params.require(:ingredient).permit(:ingredient_name, :purchase_price, :volume, :unit, :price)
    end
    


    
end