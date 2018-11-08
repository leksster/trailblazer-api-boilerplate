# frozen_string_literal: true

module Api
  class Endpoint < Trailblazer::Endpoint
    Matcher = Dry::Matcher.new(
      destroyed: Dry::Matcher::Case.new(
        match:   ->(result) { result.success? && result[:model].try(:destroyed?) },
        resolve: ->(result) { result }
      ),
      success: Dry::Matcher::Case.new(
        match:   ->(result) { result.success? },
        resolve: ->(result) { result }
      ),
      created: Dry::Matcher::Case.new(
        match:   ->(result) { result.success? && result['model.action'] == :new },
        resolve: ->(result) { result }
      ),
      not_found: Dry::Matcher::Case.new(
        match:   ->(result) { result.failure? && result[:model].nil? },
        resolve: ->(result) { result }
      ),
      invalid: Dry::Matcher::Case.new(
        match:   ->(result) { result.failure? && result['result.contract.default'] && result['result.contract.default'].failure? },
        resolve: ->(result) { result }
      )
    )

    def matcher
      Api::Endpoint::Matcher
    end
  end
end
