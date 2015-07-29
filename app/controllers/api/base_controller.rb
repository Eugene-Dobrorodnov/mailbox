class Api::BaseController < ActionController::Base
  include ApiCommonResponse

  acts_as_token_authentication_handler_for User

end
