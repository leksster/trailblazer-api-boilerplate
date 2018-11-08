# frozen_string_literal: true

module JsonapiPointers
  ATTRIBUTES = %i[
    email password
  ].freeze

  def jsonapi_pointers
    ATTRIBUTES.each_with_object({}) do |key, hash|
      hash[key] = "/data/attributes/#{key}"
    end
  end
end
