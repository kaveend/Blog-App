class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    def index
        @articles = Article.all
    end
    
    def new
       @article = Article.new
    end
    
    def edit
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article has been Successfully Created!"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def update

        if @article.update(article_params)
            flash[:Success] = "article has Been updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def show

    end
    
    def destroy
        @article.destroy
        flash[:Danger] = "article has been deleted.. \nyou will not see that article again"
        redirect_to articles_path
    end
    
    private
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
   
    
end