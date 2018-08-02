require 'rails_helper'

RSpec.describe 'UsersController', type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/users').to route_to('api/v1/users#index',format: 'json')
    end

    it 'routes to #new' do
      expect(get: 'api/users/new').to route_to('api/v1/users#new',format: 'json')
    end

    it 'routes to #show' do
      expect(get: 'api/users/1').to route_to('api/v1/users#show',id: '1',format: 'json')
    end

    it 'routes to #edit' do
      expect(get: 'api/users/1/edit').to route_to('api/v1/users#edit', id: '1', format: 'json')
    end

    it 'routes to #create' do
      expect(post: 'api/users').to route_to('api/v1/users#create',format: 'json')
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/users/1').to route_to('api/v1/users#update', id: '1',format: 'json')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/users/1').to route_to('api/v1/users#update', id: '1',format: 'json')
    end

    it 'routes to #destroy' do
      expect(delete: 'api/users/1').to route_to('api/v1/users#destroy', id: '1',format: 'json')
    end
  end
end
