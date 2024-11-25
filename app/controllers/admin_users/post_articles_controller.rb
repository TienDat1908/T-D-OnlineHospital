module AdminUsers
  class PostArticlesController < ApplicationController
    before_action :authenticate_admin_user!

    layout 'admin_dashboard'

    def index
      @post_articles = PostArticle.order(created_at: :desc).page(params[:page]).per(12)
    end
  end
end
