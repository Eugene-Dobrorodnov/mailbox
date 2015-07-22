class Api::V1::TestController < Api::BaseController

  def index
    @msg = { msg: 'API OK' }
    respond_with @msg
  end

end
