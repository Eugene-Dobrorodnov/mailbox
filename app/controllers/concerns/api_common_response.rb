module ApiCommonResponse
  extend ActiveSupport::Concern

  protected

  def responde_to_any(objects)
    render json: {
      :current_page => objects.current_page,
      :per_page => objects.per_page,
      :total_entries => objects.total_entries,
      :entries => objects
    }
  end

  def responde_on_create(object)
    if object.save
      response = { message: "#{object.class} created", status: :ok, object.class.to_s.underscore.to_sym => object }
    else
      message = "#{object.class} creating failed"
      errors = object.errors
      response = { message: message, status: :error, errors: errors }
    end

    render json: response
  end

  def raise_forbidden
    render status: 403, json: {
      success: false,
      message: 'You are not authorized!'
    }
  end

end
