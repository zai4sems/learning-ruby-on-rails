class RecipesController < ApplicationController
   
    before_action :set_recipe, only: [:edit, :update, :destroy]
   
    def my_recipe
        
    end
    
    def index
        @recipes = Recipe.all
        @recipe = Recipe.includes(:recipe_ingredients)
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def edit
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        begin
            if @recipe.save
            flash[:notice] = "recipe was successfully created"
            redirect_to recipe_path(@recipe)
            else
                render 'new'
            end
        rescue ActiveRecord::RecordNotUnique
            respond_to do |format|
            format.html { render :action => 'new' }
            format.html
            flash[:notice] = "unable to proceed because there were same ingredient being used"
            end
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
        @recipe = Recipe.includes(:recipe_ingredients).find(params[:id])
        @recipe.calculate_cost
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
        params.require(:recipe).permit(:id, :title, :description, :instructions, :_destroy, recipe_ingredients_attributes: [:id, :_destroy, :ingredient_id, :quantity, ingredient_attributes: [:id, :name, :purchase_price, :volume, :unit, :_destroy]])
    end
end