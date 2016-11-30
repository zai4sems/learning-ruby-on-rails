class RecipeMaterialsController < ApplicationController
    
    before_action :set_recipe_material, only: [:edit, :update, :show, :destroy]
    respond_to :html, :json
 
    
    def index
       @recipe_materials = RecipeMaterial.all 
    end
    
    def new
        @recipe_material = RecipeMaterial.new
    end
    
    def edit
    end
    
    def create
        @recipe_material = RecipeMaterial.new(recipe_id: params[:recipe_id], material_id: params[:material_id])
        #@recipe_material = RecipeMaterial.new(recipe_material_params)
        respond_to do |format|
            if @recipe_material.save
                format.html { redirect_to recipe_path(@recipe_material.recipe_id), notice: "Material #{@recipe_material.material.material_name} was successfully added"}
                format.json { render :show, status: :created, location: @recipe_material }
                format.js
            else
                format.html { redirect_to recipe_path(@recipe_material.recipe_id), notice: "Material #{@recipe_material.material.material_name} already added" }
                format.json { render json: @recipe_material.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end
    
    def update
       
       respond_to do |format|
            if @recipe_material.update_attributes(recipe_material_params)
                format.html { redirect_to recipe_path(@recipe_material.recipe_id), notice: "Ingredient was successfully updated"}
                format.json { respond_with_bip(@recipe_material) }
            else
                format.html { render 'edit', notice: "Update fail" }
                format.json { respond_with_bip(@recipe_material) }
            end
        end
    end
    
    def show
        
    end
    
    def destroy
        @recipe_material.destroy
        flash[:notice] = "Recipe Ingredient was successfully deleted"
        redirect_to recipe_materials_path
    end
    
    private
    def set_recipe_material
        @recipe_material = RecipeMaterial.find(params[:id])
    end
    
    def set_calculated_price
        @recipe_material.price = @recipe_material.calculate_price_per_unit
    end
    
    def recipe_material_params
        params.require(:recipe_material).permit(:recipe_id, :ingredient_id, :quantity)
    end
    
end