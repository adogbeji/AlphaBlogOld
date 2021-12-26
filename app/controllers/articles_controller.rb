class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])  # Finds article based on ID
    end

    def index
        @articles = Article.all  # Saves all articles in database table
    end
end