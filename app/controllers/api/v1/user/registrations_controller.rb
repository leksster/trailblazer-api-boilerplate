module Api
  module V1
    module User
      class RegistrationsController < ApiController
        def create
          endpoint Api::V1::Users::Operation::Register
          # binding.pry
          # render jsonapi: ::User.new(email: 'email@em.em'), class: { 'User': ::Api::V1::Users::Representer::Register }

          # if params[:create]
          #   response = {
          #     email: 'email@stubbed.com',
          #     token: 'token'
          #   }
          #   render json: response, status: :created
          # else
          #   response = {
          #     error: {
          #       message: ['error']
          #     }
          #   }
          #   render json: response, status: :unprocessable_entity
          # end
        end
      end
    end
  end
end
