module AdminUsers
  class ProfileAdminUsersController < ApplicationController
    before_action :authenticate_admin_user!

    layout 'admin_dashboard'

    def index; end
  end
end
