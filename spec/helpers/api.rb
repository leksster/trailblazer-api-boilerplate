module Helpers
  module Api
    def json_api_headers
      {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json'
      }
    end
  end
end
