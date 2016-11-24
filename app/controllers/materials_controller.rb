class MaterialsController < ApplicationController
    
    before_action :set_material, only: [:edit, :update, :show, :destroy]
    
    def search
        if params[:material]
           @material = Material.find_by_name(params[:material]) 
        end
        
        if @material
            #render json: @material
            render partial: 'lookup'
        else
           render status: :not_found, nothing: true
        end
    end
    
    def index
       @materials = Material.all 
       @material = Material.new
       #@materials = Material.paginate(page: params[:page], per_pages: 5)
    end
    
    def new
        @material = Material.new
    end
    
    def edit
    end
    
    def create
        @material = Material.new(material_params)
        respond_to do |format|
            if @material.save 
                format.html { redirect_to @material, notice: "Material was successfully created" }
                format.json {render :show, status: :created, location: @material }
                format.js 
                
            else
                format.html {render 'new'}
                format.json {render json: @material.errors, status: :unprocessable_entity }
                format.js 
            end
        end
    end
    
    def update
        @material.price = @material.calculate_price_per_unit
        respond_to do |format|
            if @material.update(material_params)
                format.html { redirect_to @material, notice: "Material was successfully updated" }
                format.json {render :show, status: :ok, location: @material }
                format.js {render layout: false}
                
            else
                format.html {render 'edit'}
                format.json {render json: @material.errors, status: :unprocessable_entity }
                format.js {render layout: false}
            end
        end
    end
    
    def show
        @material.price = @material.calculate_price_per_unit
    end
    
    def destroy
        @material.destroy
        respond_to do |format|
           format.html { redirect_to materials_path, notice: "Material was successfully deleted"}
           format.json { head :no_content}
           format.js
        end
    end
    
   
    private
    def set_material
        @material = Material.find(params[:id])
    end
    
   
    
    def material_params
        params.require(:material).permit(:material_name, :purchase_price, :purchase_quantity, :price)
    end
    
end