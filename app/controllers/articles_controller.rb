class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    if params[:category].blank?
      @articles = Article.all.order("created_at DESC")
    else
      @articles = Article.where(category_id: params[:category]).order("created_at DESC")
    end
  end

  def show
  end

  def new
    # @article = Article.new
    @article = current_user.articles.build
  end

  def create
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def upvote
    @article.upvote_by current_user
    redirect_to :back
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
