class RecipesController < ApplicationController
   
    before_action :set_recipe, only: [:edit, :update, :destroy]
   
    def my_recipe
        
    end
    
    def index
        @recipes = Recipe.all
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
        @ingredient = Ingredient.new
        @labour = ((@recipe.rate_per_hour.to_f+(Overhead.sum(:total)/((52-current_user.no_of_week_holiday_per_year.to_f)*current_user.hour_worked_per_week.to_f)))*@recipe.time_spent_in_hour.to_f)
        @cake_cost = (@recipe.cost + ((@recipe.rate_per_hour.to_f+(Overhead.sum(:total)/((52-current_user.no_of_week_holiday_per_year.to_f)*current_user.hour_worked_per_week.to_f)))*@recipe.time_spent_in_hour.to_f))
        @profit = (@recipe.percentage_profit.to_f/100)*@cake_cost.to_f
        @total = @profit.to_f + @cake_cost.to_f
    end
    
    def destroy
        @recipe.destroy
        flash[:notice] = "recipe was successfully deleted"
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
        params.require(:recipe).permit(:id, :title, :description, :instructions, :rate_per_hour, :time_spent_in_hour, :percentage_profit, :_destroy, recipe_ingredients_attributes: [:id, :_destroy, :ingredient_id, :quantity, ingredient_attributes: [:id, :name, :purchase_price, :volume, :unit, :_destroy]])
    end
end