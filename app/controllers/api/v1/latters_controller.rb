class Api::V1::LattersController < Api::BaseController

  before_action :ensure_params_exist, only: :create

  def index
    latters = Latter.inbox(current_user).paginate(page: params[:page])
    responde_to_any latters
  end

  def show
    latter = Latter.find(params[:id])
    return raise_forbidden if !latter.recipients.any? { |r| r.user == current_user } || latter.user != current_user
    render json:{ latter: latter }
  end

  def sent
    responde_to_any current_user.latters.paginate(page: params[:page])
  end

  def spam
    responde_to_any Latter.spam(current_user).paginate(page: params[:page])
  end

  def create
    latter = current_user.latters.create(latter_params)
    responde_on_create latter
  end

  private

  def latter_params
    data = params.require(:latter).permit(:subject, :content, :attachment, users: [])
    data[:users] = User.where(id: data[:users])
    data
  end

  def ensure_params_exist
    return unless params[:latter].blank?
    render status: 422, json: {
      success: false,
      message: 'missing latter parameter'
    }
  end

end
