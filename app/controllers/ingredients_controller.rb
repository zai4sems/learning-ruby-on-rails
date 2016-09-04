class IngredientsController < ApplicationController
    
    def index
       @ingredients = Ingredient.all 
    end
    
    def new
        @ingredient = Ingredient.new
    end
    
    def edit
        @ingredient = Ingredient.find(params[:id])
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
    
    def update
       @ingredient = Ingredient.find(params[:id]) 
       if @ingredient.update(ingredient_params)
           flash[:notice] = "Ingredient was successfully updated"
           redirect_to ingredient_path(@ingredient)
       else
           render 'edit'
       end
    end
    
    def show
        @ingredient = Ingredient.find(params[:id])
    end
    
    def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy
        flash[:notice] = "Ingredient was successfully deleted"
        redirect_to ingredients_path
    end
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:ingredient_name, :purchase_price)
    end
    
end