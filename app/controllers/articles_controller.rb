class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])  # Finds article based on ID
    end

    def index
        @articles = Article.all  # Saves all articles in database table
    end

    def new
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])  # Finds article based on ID
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        
        if @article.save
          flash[:notice] = 'Article was created successfully!'

        # redirect_to article_path(@article)  # Original redirect code
          redirect_to @article  # Redirect shortcut 
        else
          render 'new'  # Renders new action template
        end

    end

    def update
      @article = Article.find(params[:id])  # Finds the article to be edited by ID
      @article.update(params.require(:article).permit(:title, :description))
    end
end