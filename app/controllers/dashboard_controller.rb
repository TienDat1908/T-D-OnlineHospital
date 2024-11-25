class DashboardController < ApplicationController
  layout 'dashboard', only: [:index]

  def index
    @post_articles = current_user.post_articles
  end
end
