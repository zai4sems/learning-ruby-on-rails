class RecipeIngredientsController < ApplicationController
    
    before_action :set_recipe_ingredient, only: [:edit, :update, :show, :destroy]
    respond_to :html, :json
 
    
    def index
       @recipe_ingredients = RecipeIngredient.all 
    end
    
    def new
        @recipe_ingredient = RecipeIngredient.new
    end
    
    def edit
    end
    
    def create
        @recipe_ingredient = RecipeIngredient.new(recipe_id: params[:recipe_id], ingredient_id: params[:ingredient_id])
        #@recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
        respond_to do |format|
            if @recipe_ingredient.save
                format.html { redirect_to recipe_path(@recipe_ingredient.recipe_id), notice: "Ingredient #{@recipe_ingredient.ingredient.name} was successfully added"}
                format.json { render :show, status: :created, location: @recipe_ingredient }
                format.js
            else
                format.html { render 'new', notice: "yuyuy" }
                format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end
    
    def update
       
       respond_to do |format|
            if @recipe_ingredient.update_attributes(recipe_ingredient_params)
                format.html { redirect_to recipe_path(@recipe_ingredient.recipe_id), notice: "Ingredient was successfully updated"}
                format.json { respond_with_bip(@recipe_ingredient) }
            else
                format.html { render 'edit', notice: "Update fail" }
                format.json { respond_with_bip(@recipe_ingredient) }
            end
        end
    end
    
    def show
        
    end
    
    def destroy
        @recipe_ingredient.destroy
        flash[:notice] = "Recipe Ingredient was successfully deleted"
        redirect_to recipe_ingredients_path
    end
    
    private
    def set_recipe_ingredient
        @recipe_ingredient = RecipeIngredient.find(params[:id])
    end
    
    def set_calculated_price
        @recipe_ingredient.price = @recipe_ingredient.calculate_price_per_unit
    end
    
    def recipe_ingredient_params
        params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :quantity)
    end
    
end