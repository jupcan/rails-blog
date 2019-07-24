class CommentsController < ApplicationController
    before_action :set_article
    def create
        @comment = Comment.new(comment_params)
        @comment.author_name = current_user.email.split('@').first
        @comment.article_id = params[:article_id]
        @comment.save
        redirect_to article_path(@comment.article)
    end
      
    def comment_params
        params.require(:comment).permit(:body)
    end

    private 
        def set_article
            @article = Article.find params[:article_id]
        end

end
