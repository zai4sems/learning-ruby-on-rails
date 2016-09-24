class RecipeIngredientsController < ApplicationController
    
    before_action :set_recipe_ingredient, only: [:edit, :update, :show, :destroy]
 
    
    def index
       @recipe_ingredients = RecipeIngredient.all 
    end
    
    def new
        @recipe_ingredient = RecipeIngredient.new
    end
    
    def edit
    end
    
    def create
        @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
        if @recipe_ingredient.save
            flash[:notice] = "Recipe Ingredient was successfully created"
            #redirect_to recipe_ingredient_path(@recipe_ingredient)
            redirect_to recipe_recipe_ingredients_path
        else
            render 'new'
        end
    end
    
    def update
       if @recipe_ingredient.update(recipe_ingredient_params)
           flash[:notice] = "Recipe Ingredient was successfully updated"
           redirect_to recipe_ingredient_path(@recipe_ingredient)
       else
           render 'edit'
       end
    end
    
    def show
        
    end
    
    def destroy
        @recipe_ingredient.destroy
        flash[:notice] = "Recipe Ingredient was successfully deleted"
        redirect_to recipe_recipe_ingredients_path
    end
    
    private
    def set_recipe_ingredient
        @recipe_ingredient = RecipeIngredient.find(params[:id])
    end
    
    def set_calculated_price
        @recipe_ingredient.price = @recipe_ingredient.calculate_price_per_unit
    end
    
    def recipe_ingredient_params
        params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :quantity, ingredients_attributes: [:id, :ingredient_name, :purchase_price, :volume, :unit],
        recipes_attributes: [:id, :title, :description, :instructions])
    end
    
end