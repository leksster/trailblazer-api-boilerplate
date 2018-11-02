module Api
  module V1
    module User
      class RegistrationsController < ApiController
        def create
          if params[:create]
            response = {
              email: 'email@stubbed.com',
              token: 'token'
            }
            render json: response, status: :created
          else
            response = {
              error: {
                message: ['error']
              }
            }
            render json: response, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
