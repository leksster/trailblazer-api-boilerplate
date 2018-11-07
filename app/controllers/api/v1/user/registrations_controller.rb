module Api
  module V1
    module User
      class RegistrationsController < ApiController
        def create
          endpoint Api::V1::Users::Operation::Register
        end
      end
    end
  end
end
