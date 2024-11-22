module AdminUsers
  class UsersController < ApplicationController
    before_action :authenticate_admin_user!

    layout 'admin_dashboard'

    def index
      @users = User.all
    end
  end
end
