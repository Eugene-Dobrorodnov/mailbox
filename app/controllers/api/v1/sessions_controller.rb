class Api::V1::SessionsController < Devise::SessionsController
  include ApiAuth

  before_action :ensure_params_exist
  skip_before_action :verify_authenticity_token

  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])

    return invalid_login_attempt unless resource
    return invalid_login_attempt unless resource.valid_password?(params[:user][:password])

    render json: {
      success: true,
      user: resource
    }
  end

  protected

  def invalid_login_attempt
    warden.custom_failure!
    render status: 401, json: {
      success: false,
      message: 'Error with your login or password'
    }
  end
end
