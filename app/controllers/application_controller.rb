class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_users_dashboard_admin_path
    else
      dashboard_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
