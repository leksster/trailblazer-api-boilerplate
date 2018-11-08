# frozen_string_literal: true

module DefaultEndpoints
  protected

  def default_handler
    lambda do |m|
      m.destroyed { |_result| head :no_content }
      m.created do |result|
        render jsonapi: result[:model], **result[:renderer_options], status: :created
      end
      m.success { |result| render json: result[:model].extend(result['representer.render.class']).to_json }
      m.invalid do |result|
        render jsonapi_errors: result['contract.default'].errors, class: { 'Reform::Form::ActiveModel::Errors': JSONAPI::Rails::SerializableActiveModelErrors }, status: :unprocessable_entity
      end
      m.not_found { |result| render json: { error: result[:error] }, status: :not_found }
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    Api::Endpoint.call(operation_class, default_handler, { params: params.to_unsafe_h }, &block)
  end
end
