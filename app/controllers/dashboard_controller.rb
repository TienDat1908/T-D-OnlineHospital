class DashboardController < ApplicationController
  layout 'dashboard', only: [:index]

  def index; end
end
