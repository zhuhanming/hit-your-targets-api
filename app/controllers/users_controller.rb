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

  # POST /update_user
  def update_user
    current_user.update(insecure_user_params)
    json_response(current_user.slice("name", "email", "display_image_url", "preferences", "complete_order", "incomplete_order"))
  end

  # POST /update_user_password
  def update_user_password
    if current_user.authenticate(params[:old_password])
      current_user.update(password_change_params)
      response = { message: Message.password_changed }
      json_response(response)
    else
      response = { message: Message.password_does_not_match }
      json_response(response)
    end
  end

  # GET /auth/me
  def show
    json_response(current_user.slice("name", "email", "display_image_url", "preferences", "complete_order", "incomplete_order"))
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :display_image_url,
      :preferences => {},
      :complete_order => [],
      :incomplete_order => [],
    )
  end

  def insecure_user_params
    params.permit(
      :name,
      :display_image_url,
      :preferences => {},
      :complete_order => [],
      :incomplete_order => [],
    )
  end

  def password_change_params
    params.permit(
      :password,
      :password_confirmation,
    )
  end
end
