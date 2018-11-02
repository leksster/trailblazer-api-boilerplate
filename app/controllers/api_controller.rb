class ApiController < ApplicationController
  before_action :restrict_content_type

  protected

  def default_handler
    ->(m) do
      m.destroyed { |result| head :no_content }
      # m.present { |result| render json: result[:model].extend(result['representer.render.class']).to_json }
      m.created { |result| render json: result[:model].extend(result['representer.render.class']).to_json, status: :created }
      m.success { |result| render json: result[:model].extend(result['representer.render.class']).to_json }
      m.invalid { |result| render json: result["representer.errors.class"].new(result["result.contract.default"].errors.messages).to_json, status: :unprocessable_entity }
      m.not_found { |result| render json: { error: result[:error] }, status: :not_found }
      # m.unauthenticated { |result| render json: result[:model].extend(result['representer.render.class']).to_json }
    end
  end

  def endpoint(operation_class, options={}, &block)
    Api::Endpoint.(operation_class, default_handler, {params: params.to_unsafe_h}, &block)
  end

  private

  def restrict_content_type
    return if request.content_type == 'application/vnd.api+json'

    render json: { msg: 'Content-Type must be application/vnd.api+json' }, status: 406
  end
end
