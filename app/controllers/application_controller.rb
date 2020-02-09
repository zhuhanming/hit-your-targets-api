class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user
  skip_before_action :authorize_request, only: :show_default

  def show_default
    render plain: "Hit Your Targets API is up and running. Get started now at www.hityourtargets.xyz"
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
