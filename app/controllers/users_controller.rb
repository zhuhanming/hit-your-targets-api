class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    if User.exists?(email: user_params[:email])
      response = { message: Message.account_already_exists }
      json_response(response)
    else
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    end
  end

  # GET /auth/me
  def show
    json_response(current_user.slice("name", "email", "display_image_url", "preferences"))
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :display_image_url,
      :preferences
    )
  end
end
