class CategoriesController < ApplicationController
    
    def index
        @categories = Category.paginate(page: params[:page], per_page: 10)
    end
    
    def new
        @category = Category.new
    end
    
    def create 
    
    end
    
    def show
        
    end
    
end