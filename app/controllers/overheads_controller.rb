class OverheadsController < ApplicationController
    
    before_action :set_overhead, only: [:edit, :show, :update, :destroy]
    respond_to :html, :json, :js
    
    def index
        @overheads = current_user.overheads
        @overhead = Overhead.new
    end
    
    def new
        @overhead = Overhead.new
    end
    
    def edit 
    end

    def create
        @overhead = Overhead.new(overhead_params)
        @overhead.user = current_user
        respond_to do |format|
            if @overhead.save 
                format.html { redirect_to @overhead, flash[:notice] = "Overhead was successfully created" }
                format.json {render :show, status: :created, location: @overhead }
                format.js 
                
            else
                format.html {render 'new'}
                format.json {render json: @overhead.errors, status: :unprocessable_entity }
                format.js 
            end
        end
    end
    
    def update
        respond_to do |format|
            if @overhead.update_attributes(overhead_params)
                format.html { redirect_to @overhead, flash[:notice] = "Overhead was successfully updated" }
                format.json {respond_with_bip(@overhead) }
                #format.json {render :show, status: :ok, location: @overhead }
                format.js {render layout: false}
                
            else
                format.html {render 'edit'}
                format.json {respond_with_bip(@overhead) }
                format.js {render layout: false}
            end
        end
    end
    
    def show
    end
    
    def destroy
        @overhead.destroy
        respond_to do |format|
           format.html { redirect_to overheads_path, flash[:notice] = "Ingredient was successfully deleted"}
           format.json { head :no_content}
           format.js
        end
    end
    
    def set_overhead
        @overhead = Overhead.find(params[:id])
    end
    
    def overhead_params
        params.require(:overhead).permit(:title, :month_1, :month_2, :month_3, :month_4, :month_5, :month_6, :month_7, :month_8, :month_9, :month_10, :month_11, :month_12)
    end
end