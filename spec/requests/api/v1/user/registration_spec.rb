# frozen_string_literal: true

RSpec.describe 'Api::V1::User::Registration', type: :request do
  # include Helpers::Api
  include ApiDoc::V1::User::Registration::Api

  describe 'POST #create' do
    include ApiDoc::V1::User::Registration::Create

    describe 'Success' do
      let(:valid_params) { { email: 'email@email.em', password: '123456', password_confirmation: '123456' }.to_json }

      before { post '/api/v1/user/registration', params: valid_params, headers: json_api_headers }

      it 'renders created user', :dox do
        expect(response).to be_created
      end
    end

    describe 'Fail' do
      before { post '/api/v1/user/registration', headers: json_api_headers }

      it 'renders errors', :dox do
        expect(response).to be_unprocessable
      end
    end
  end
end
