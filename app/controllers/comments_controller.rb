class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully added'
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  def upvote
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.upvote_by current_user
    
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :body, :user_id)
  end
end
