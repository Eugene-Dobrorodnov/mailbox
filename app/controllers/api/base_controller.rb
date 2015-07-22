class Api::BaseController < ActionController::Base
  respond_to :json

  acts_as_token_authentication_handler_for User

end
