class ApplicationApiController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    if header.present?
      token = header.split(' ').last
      begin
        decoded = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, { algorithm: 'HS256' })
        @current_user = User.find(decoded[0]['user_id'])
      rescue JWT::DecodeError => e
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Authorization token missing' }, status: :unauthorized
    end
  end
end
