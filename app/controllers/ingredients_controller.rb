class IngredientsController < ApplicationController
    
    before_action :set_ingredient, only: [:edit, :update, :show, :destroy]
    respond_to :html, :json, :js
    
    def search
        if params[:ingredient]
           @ingredient = Ingredient.find_by_name(params[:ingredient]) 
        end
        
        if @ingredient
            #render json: @ingredient
            render partial: 'lookup'
        else
           render status: :not_found, nothing: true
        end
    end
    
    
    def index
       @ingredient = Ingredient.new
       @ingredients = current_user.ingredients
    end
    
    def new
        @ingredient = Ingredient.new
    end
    
    def edit
    end
    
    def create
        @ingredient = Ingredient.new(ingredient_params)
        @ingredient.user = current_user
        respond_to do |format|
            if @ingredient.save 
                format.html { redirect_to @ingredient, notice: "Ingredient was successfully created" }
                format.json {render :show, status: :created, location: @ingredient }
                format.js 
                
            else
                format.html {render 'new'}
                format.json {render json: @ingredient.errors, status: :unprocessable_entity }
                format.js 
            end
        end
    end
    
    def update
        @ingredient.price = @ingredient.calculate_price_per_unit
        
        respond_to do |format|
            if @ingredient.update_attributes(ingredient_params)
                format.html { redirect_to @ingredient, notice: "Ingredient was successfully updated" }
                format.json {respond_with_bip(@ingredient) }
                #format.json {render :show, status: :ok, location: @ingredient }
                format.js {render layout: false}
                
            else
                format.html {render 'edit'}
                format.json {respond_with_bip(@ingredient) }
                format.js {render layout: false}
            end
        end
    end
    
    def show
        @ingredient.price = @ingredient.calculate_price_per_unit
    end
    
    def destroy
        @ingredient.destroy
        respond_to do |format|
           format.html { redirect_to ingredients_path, notice: "Ingredient was successfully deleted"}
           format.json { head :no_content}
           format.js
        end
    end
    
   
    private
    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end
    
   
    
    def ingredient_params
        params.require(:ingredient).permit(:name, :purchase_price, :volume, :unit, :price)
    end
    
end