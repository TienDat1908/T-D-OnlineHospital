module AdminUsers
  class FeedbacksController < ApplicationController
    before_action :authenticate_admin_user!
    layout 'admin_dashboard'

    def index
      @q = Feedback.ransack(params[:q])
      @feedbacks = @q.result.order(created_at: :desc).page(params[:page]).per(12)
    end

    def content_feedback
      @feedback = Feedback.find(params[:id])
    end
  end
end
