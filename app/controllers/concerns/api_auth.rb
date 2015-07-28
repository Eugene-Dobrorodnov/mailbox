module ApiAuth
  extend ActiveSupport::Concern

  protected

  def ensure_params_exist
    return unless params[:user].blank?
    render status: 422, json: {
      success: false,
      message: 'missing user parameter'
    }
  end

end
