module Api
  module V1
    class PostArticlesController < ApplicationApiController
      def index
        post_articles = @current_user.post_articles
        render json: post_articles, status: :ok
      end

      def show
        post_article = @current_user.post_articles.find(params[:id])
        render json: post_article, status: :ok
      end

      def create
        post_article = @current_user.post_articles.build(post_article_params)
        if post_article.save
          render json: post_article, status: :created
        else
          render json: { errors: post_article.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        post_article = @current_user.post_articles.find(params[:id])
        if post_article.update(post_article_params)
          render json: post_article, status: :ok
        else
          render json: { errors: post_article.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        post_article = @current_user.post_articles.find(params[:id])
        post_article.destroy
        render json: { message: 'Post deleted successfully' }, status: :ok
      end

      private

      def post_article_params
        params.require(:post_article).permit(:title, :content)
      end
    end
  end
end
