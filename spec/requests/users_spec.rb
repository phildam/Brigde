require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'should route to #index' do
      get '/api/users'
      expect(response).to have_http_status(200)
    end
  end
end
