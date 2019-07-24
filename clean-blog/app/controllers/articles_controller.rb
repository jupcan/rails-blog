class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    def index
        @articles = Article.all
    end

    def new
        @article = current_user.articles.new
    end

    def create
        @article = current_user.articles.new(article_params)
        if @article.save
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        @comment = Comment.new
    end

    def edit
    end

    def update
        if @article.update(article_params)
         flash[:success] = "article was updated"
         redirect_to article_path(@article)
        else
         flash[:success] = "article was not updated"
         render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:success] = "article was deleted"
        redirect_to root_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end

        def set_article
            @article = Article.find(params[:id])
        end
end