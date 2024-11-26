module AdminUsers
  class UsersController < ApplicationController
    before_action :authenticate_admin_user!

    layout 'admin_dashboard'

    def index
      @users = User.order(created_at: :desc).page(params[:page]).per(11)
    end
  end
end
