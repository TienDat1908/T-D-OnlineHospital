class PostArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_articles = current_user.post_articles
  end

  def show
    @post_article = PostArticle.find(params[:id])
  end

  def new
    @post_article = current_user.post_articles.build
  end

  def create
    @post_article = current_user.post_articles.build(post_article_params)
    if @post_article.save
      redirect_to @post_article, notice: 'Post created successfully.'
    else
      render :new
    end
  end

  def edit
    @post_article = current_user.post_articles.find(params[:id])
  end

  def update
    @post_article = current_user.post_articles.find(params[:id])
    if @post_article.update(post_article_params)
      redirect_to @post_article, notice: 'Post updated successfully.'
    else
      render :edit
    end
  end

  private

  def post_article_params
    params.require(:post_article).permit(:title, :content)
  end
end
