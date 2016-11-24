class OverheadsController < ApplicationController
    
    before_action :set_overhead, only: [:edit, :show, :update, :destroy]
    
    def index
        @overheads = current_user.overheads
    end
    
    def new
        @overhead = Overhead.new
    end
    
    def edit 
    end

    def create
        @overhead = Overhead.new(overhead_params)
        @overhead.user = current_user
        if @overhead.save
            flash[:notice] = "overhead was successfully created"
            redirect_to overheads_path
        else
            render 'new'
        end
    end
    
    def update
        
        respond_to do |format|
            if @overhead.update_attributes(overhead_params)
                format.html { redirect_to @overhead, notice: "Overhead was successfully updated" }
                format.json {respond_with_bip(@overhead) }
            else
                format.html {render 'edit'}
                format.json {respond_with_bip(@overhead) }
            end
        end
        
    end
    
    def show
    end
    
    def destroy
        @overhead.destroy
        flash[:notice] = "Overhead was successfully deleted"
        redirect_to overheads_path
    end
    
    def set_overhead
        @overhead = Overhead.find(params[:id])
    end
    
    def overhead_params
        params.require(:overhead).permit(:title, :month_1, :month_2, :month_3, :month_4, :month_5, :month_6, :month_7, :month_8, :month_9, :month_10, :month_11, :month_12)
    end
end