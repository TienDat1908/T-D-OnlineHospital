module Api
  module V1
    class FeedbacksController < ApplicationApiController
      def create
        feedback = @current_user.feedbacks.build(feedback_params)
        if feedback.save
          render json: feedback, status: :created
        else
          render json: { errors: feedback.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def feedback_params
        params.require(:feedback).permit(
          :title,
          :description,
          images: []
        )
      end
    end
  end
end
