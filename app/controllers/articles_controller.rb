class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end
    def index 
        @articles = Article.all
    end
    def new

    end
    def create 
      @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
        flash[:notice] = "Article was created successfully."
        redirect_to article_path(@article)
        #redirect_to articles_path()
      else
        render 'new'
      end
    end
end