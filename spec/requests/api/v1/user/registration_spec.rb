# frozen_string_literal: true

RSpec.describe 'Api::V1::User::Registration', type: :request do
  include ApiDoc::V1::User::Registration::Api

  describe 'POST #create' do
    include ApiDoc::V1::User::Registration::Create

    describe 'Success' do
      let(:valid_params) do
        {
          email: FFaker::Internet.email,
          password: '!1password',
          password_confirmation: '!1password'
        }.to_json
      end

      before { post '/api/v1/user/registration', params: valid_params, headers: json_api_headers }

      it 'renders created user', :dox do
        expect(response).to be_created
        expect(response).to match_json_schema('user/registration')
      end
    end

    describe 'Fail' do
      before { post '/api/v1/user/registration', headers: json_api_headers }

      it 'renders errors', :dox do
        expect(response).to be_unprocessable
        expect(response).to match_json_schema('errors')
      end
    end
  end
end
