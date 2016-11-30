class RecipesController < ApplicationController
   
    before_action :set_recipe, only: [:edit, :update, :destroy]
   
    def my_recipes
        @recipes = current_user.recipes.paginate(page: params[:page], per_page: 6)
    end
    
    
    def index
        #@recipes = current_user.recipes.paginate(page: params[:page], per_page: 6)
        @recipes = current_user.recipes
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def edit
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user = current_user
        @recipe.recipe_ingredients.each do |f|
            f.ingredient.user = current_user
        end
        @recipe.recipe_materials.each do |f|
            f.material.user = current_user
        end
        
        begin
            if @recipe.save
            flash[:notice] = "recipe was successfully created"
            redirect_to recipe_path(@recipe)
            else
                flash[:notice] = "Recipe cannot be created"
                render 'new'
            end
        rescue ActiveRecord::RecordNotUnique
            respond_to do |format|
            format.html { render :action => 'new' }
            format.html
            flash[:notice] = "Unable to proceed because there were same ingredient being used"
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
        @recipe_ingredient = RecipeIngredient.new
        @ingredient = Ingredient.new
        @ingredients = current_user.ingredients
        @materials = current_user.materials
        @recipe = Recipe.includes(:recipe_ingredients, :recipe_materials).find(params[:id])
        @recipe.calculate_cost
        @recipe.calculate_material_cost
        @labour = ((@recipe.rate_per_hour.to_f+(current_user.overheads.sum(:total)/((52-current_user.no_of_week_holiday_per_year.to_f)*current_user.hour_worked_per_week.to_f)))*@recipe.time_spent_in_hour.to_f)
        @cake_cost = (@recipe.cost.to_f + @recipe.material_cost.to_f + ((@recipe.rate_per_hour.to_f+(current_user.overheads.sum(:total)/((52-current_user.no_of_week_holiday_per_year.to_f)*current_user.hour_worked_per_week.to_f)))*@recipe.time_spent_in_hour.to_f))
        @profit = (@recipe.percentage_profit.to_f/100)*@cake_cost.to_f
        @total = @profit.to_f + @cake_cost.to_f
    end
    
    def destroy
        @recipe.destroy
        flash[:notice] = "recipe was successfully deleted"
        #redirect_to recipes_path
        redirect_to my_recipes_path
    end
    
    def new_release
        respond_to do |format|
        format.html
        format.js
        end
    end
    
    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    def recipe_params
        #params.require(:recipe).permit(:id, :title, :image, :description, :instructions, :rate_per_hour, :time_spent_in_hour, :percentage_profit, :_destroy, recipe_ingredients_attributes: [:id, :_destroy, :ingredient_id, :quantity, ingredient_attributes: [:id, :name, :purchase_price, :volume, :unit, :_destroy]])
        params.require(:recipe).permit(:id, :title, :image, :description, :instructions, :rate_per_hour, :time_spent_in_hour, :percentage_profit, :serving_number, :_destroy, 
        recipe_ingredients_attributes: [:id, :_destroy, :ingredient_id, :quantity, ingredient_attributes: [:id, :name, :purchase_price, :volume, :unit, :user_id, :_destroy]],
        recipe_materials_attributes: [:id, :_destroy, :material_id, :quantity, material_attributes: [:id, :material_name, :purchase_price, :purchase_quantity, :_destroy]])
        
        
    end
    
    
end