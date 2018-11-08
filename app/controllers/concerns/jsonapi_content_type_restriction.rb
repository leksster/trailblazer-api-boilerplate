module JsonapiContentTypeRestriction
  before_action :restrict_content_type

  private

  def restrict_content_type
    return if request.content_type == 'application/vnd.api+json'

    render json: { msg: 'Content-Type must be application/vnd.api+json' }, status: 406
  end
end
