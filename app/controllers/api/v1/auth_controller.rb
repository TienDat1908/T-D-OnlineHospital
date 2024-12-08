class Api::V1::AuthController < ApplicationApiController
  skip_before_action :authorize_request, only: %i[login signup]

  def login
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      user.update_columns(current_sign_in_at: Time.current, last_sign_in_at: user.current_sign_in_at, status: true)

      token = encode_token(user)
      render json: { token: token, user_id: user.id }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def signup
    user = User.new(user_params)

    if user.save
      user.update_columns(current_sign_in_at: Time.current, status: true)
      token = encode_token(user)
      render json: { token: token, user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def logout
    user = User.find_by(id: @current_user.id)

    if user
      user.update(status: false)
      render json: { message: 'Successfully logged out' }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def update_profile
    if @current_user.update(profile_params)
      render json: { user: @current_user, message: 'Profile updated successfully' }, status: :ok
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  def profile_params
    params.require(:user).permit(
      :phone_number,
      :first_name,
      :last_name,
      :location,
      :avatar,
      :nick_name,
      :date_of_birth
    )
  end

  def encode_token(user)
    JWT.encode({ user_id: user.id, exp: 24.hours.from_now.to_i }, Rails.application.credentials.jwt_secret_key, 'HS256')
  end
end
