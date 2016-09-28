class RecipesController < ApplicationController
   
    before_action :set_recipe, only: [:edit, :update, :show, :destroy]
   
    def my_recipe
        
    end
    
    def index
       @recipes = Recipe.all 
    end
    
    def new
        @recipe = Recipe.new
        
        #@recipe.recipe_ingredients.build.build_ingredient #new 21/9
        #@recipe.recipe_ingredients.each do |recipe_ingredient|
            #recipe_ingredient.ingredients_build
        #end
         
        #@recipe.recipe_ingredients.build
        @recipe.ingredients.build.recipe_ingredients.build
        #@recipe.ingredients.each do |ingredient|
            #ingredient.recipe_ingredients.build
        #end
       
    end
    
    def edit
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        #@recipe.cost = @recipe.calculate_cost
        if @recipe.save 
            flash[:notice] = "recipe was successfully created"
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end
    
    def update
       #@recipe.cost = @recipe.calculate_cost
       #@recipe.ingredients.build
       if @recipe.update(recipe_params)
           flash[:notice] = "recipe was successfully updated"
           redirect_to recipe_path(@recipe)
       else
           render 'edit'
       end
    end
    
    def show
        #@recipe.cost = @recipe.calculate_cost
    end
    
    def destroy
        @recipe.destroy
        flash[:notice] = "recipe was successfully deleted"
        redirect_to recipes_path
    end
    
    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    def recipe_params
        params.require(:recipe).permit(:id, :title, :description, :instructions, ingredients_attributes: [:id, :name, :purchase_price, :volume, :unit, :_destroy])
        #params.require(:recipe).permit(:id, :title, :description, :instructions, ingredients_attributes: [:id, :name, :purchase_price, :volume, :unit, :_destroy],
        #recipe_ingredients_attributes: [:id, :recipe_id, :ingredient_id, :quantity, :_destroy]) #dapat tapi row x selari
        #params.require(:recipe).permit(:id, :title, :description, :instructions, recipe_ingredients_attributes: [:id, :recipe_id, :ingredient_id, :quantity, :_destroy, 
        #ingredient_attributes: [:id, :name, :purchase_price, :volume, :unit, :_destroy]]) #quantity masuk, ingredient x masuk
    end
end