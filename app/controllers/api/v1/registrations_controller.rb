class Api::V1::RegistrationsController < Devise::RegistrationsController
  include ApiAuth

  before_action :ensure_params_exist
  skip_before_action :verify_authenticity_token

  def create
    @user = User.create(person_params)
    if @user.save
      render json: {user: @user}
    else
      render json: {err: @user.errors}
    end
  end

  private

  def person_params
    params.require(:user).permit(:email, :password)
  end
end
