RSpec.describe 'User Registration' do
  it 'works' do
    post '/api/v1/user/registration', params: { first_name: 'yes' }
  end
end