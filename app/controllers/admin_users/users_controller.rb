module AdminUsers
  class UsersController < ApplicationController
    before_action :authenticate_admin_user!
    before_action :set_user, only: %i[profile_user destroy]
    layout 'admin_dashboard'

    def index
      @q = User.ransack(params[:q])
      @users = @q.result.order(created_at: :desc).page(params[:page]).per(12)
    end

    def profile_user
      @user
    end

    def destroy
      @user.destroy
      redirect_to admin_users_users_path, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
