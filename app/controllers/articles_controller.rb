class ArticlesController < ApplicationController
    before_action :set_article  
    

    def show
        
    end

    def index
        @articles = Article.all  # Saves all articles in database table
    end

    def new
      @article = Article.new
    end

    def edit
      
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
      
      if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = 'Article was updated successfully!'
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      
      @article.destroy
      redirect_to articles_path
    end

    private 

    def set_article
      @article = Article.find(params[:id])  # Finds article based on ID
    end
end