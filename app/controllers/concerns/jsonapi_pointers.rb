# frozen_string_literal: true

module JsonapiPointers
  def jsonapi_pointers
    %i[email password].each_with_object({}) do |key, hash|
      hash[key] = "/data/attributes/#{key}"
    end
  end
end
