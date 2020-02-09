class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  skip_before_action :authorize_request, only: :show
  attr_reader :current_user

  def show
    render plain: "Hit Your Targets API is up and running. Get started now at www.hityourtargets.xyz"
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
