# frozen_string_literal: true

class ApiController < ApplicationController
  include JsonapiPointers

  before_action :restrict_content_type

  protected

  def default_handler
    lambda do |m|
      m.destroyed { |_result| head :no_content }
      # m.present { |result| render json: result[:model].extend(result['representer.render.class']).to_json }
      m.created do |result|
        render jsonapi: result[:model], **result[:renderer_options], status: :created
      end
      m.success { |result| render json: result[:model].extend(result['representer.render.class']).to_json }
      m.invalid do |result|
        binding.pry
        render jsonapi_errors: result['contract.default'].errors, class: { 'Reform::Form::ActiveModel::Errors': JSONAPI::Rails::SerializableActiveModelErrors }, status: :unprocessable_entity
      end
      m.not_found { |result| render json: { error: result[:error] }, status: :not_found }
      # m.unauthenticated { |result| render json: result[:model].extend(result['representer.render.class']).to_json }
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    Api::Endpoint.call(operation_class, default_handler, { params: params.to_unsafe_h }, &block)
  end

  private

  def restrict_content_type
    return if request.content_type == 'application/vnd.api+json'

    render json: { msg: 'Content-Type must be application/vnd.api+json' }, status: 406
  end
end
