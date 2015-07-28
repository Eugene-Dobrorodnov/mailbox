class Api::V1::HomeController < Api::BaseController

  def index
    render json: { msg: 'API OK' }
  end

end
