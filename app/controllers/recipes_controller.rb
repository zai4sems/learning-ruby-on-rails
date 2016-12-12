class RecipesController < ApplicationController
   
    before_action :set_recipe, only: [:edit, :update, :destroy]
   
    def my_recipes
        @recipes = current_user.recipes.paginate(page: params[:page], per_page: 9)
        
    end
    
    
    def index
        #@recipes = current_user.recipes.paginate(page: params[:page], per_page: 6)
        @recipes = current_user.recipes
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def edit
        #@recipe.recipe_ingredients.build
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user = current_user
        #@recipe = current_user.recipes.build(recipe_params)
        
        unless @recipe.recipe_ingredients.nil?
            @recipe.recipe_ingredients.each do |f|
                
                unless f.ingredient.nil?
                    f.ingredient.user = current_user
                end
            end
        end
        
        unless @recipe.recipe_materials.nil?
            @recipe.recipe_materials.each do |f|
                
                unless f.material.nil?
                    f.material.user = current_user
                end
            end
        end
        
        
        begin
            if @recipe.save
            flash[:notice] = "Recipe was successfully created"
            redirect_to recipe_path(@recipe)
            else
                flash[:danger] = "Recipe cannot be created"
                render 'new'
            end
        rescue ActiveRecord::RecordNotUnique
            respond_to do |format|
            format.html { render :action => 'new' }
            format.html
            flash[:danger] = "Unable to proceed because there were same ingredient being used"
            end
        end
    end
    

    
    def update
       #@recipe.cost = @recipe.calculate_cost
       #@recipe.ingredients.build
        
        unless @recipe.recipe_ingredients.nil?
            @recipe.recipe_ingredients.each do |f|
                
                unless f.ingredient.nil?
                    f.ingredient.user = current_user
                end
            end
        end
        
        
        if @recipe.recipe_materials.nil?
        else
            @recipe.recipe_materials.each do |f|
                
                if f.material.nil?
                else
                    f.material.user = current_user
                end
            end
        end
        
       if @recipe.update(recipe_params)
           flash[:notice] = "Recipe was successfully updated"
           redirect_to recipe_path(@recipe)
       else
           render 'edit'
       end
    end
    
    
    def show
        @recipe_ingredient = RecipeIngredient.new
        #@ingredient = @recipe_ingredient.ingredients.build
        #@ingredient = Ingredient.new
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
        flash[:notice] = "Recipe was successfully deleted"
        #redirect_to recipes_path
        redirect_to recipes_path
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
        recipe_ingredients_attributes: [:id, :_destroy, :recipe_id, :ingredient_id, :quantity, ingredient_attributes: [:id, :name, :purchase_price, :volume, :unit, :user_id, :_destroy]],
        recipe_materials_attributes: [:id, :_destroy, :recipe_id, :material_id, :quantity, material_attributes: [:id, :material_name, :purchase_price, :purchase_quantity, :user_id, :_destroy]])
        
        
    end
    
    
end