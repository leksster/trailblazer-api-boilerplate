# frozen_string_literal: true

class ApiController < ApplicationController
  include DefaultEndpoints
  include JsonapiParsing
  include JsonapiPointers
  include JsonapiContentTypeRestriction
end
