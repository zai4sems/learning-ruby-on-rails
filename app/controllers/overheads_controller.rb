class OverheadsController < ApplicationController
    
    before_action :set_overhead, only: [:edit, :show, :update, :destroy]
    
    def index
        @overheads = Overhead.all
    end
    
    def new
        @overhead = Overhead.new
    end
    
    def edit 
    end

    def create
        @overhead = Overhead.new(overhead_params)
        if @overhead.save
            flash[:notice] = "overhead was successfully created"
            redirect_to overhead_path(@overhead)
        else
            render 'new'
        end
    end
    
    def update
        if @overhead.update(overhead_params)
           flash[:notice] = "Overhead was successfully updated"
           redirect_to overhead_path(@overhead)
        else
           render 'edit'
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