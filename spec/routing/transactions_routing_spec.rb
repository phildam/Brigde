require 'rails_helper'

RSpec.describe 'TransactionsController', type: :routing do
  describe 'routing' do
    it 'Routes to #destroy' do
      expect(delete: 'api/transactions/1').to route_to('api/v1/transactions#destroy', id: '1', format: 'json')
    end

    it 'Routes to #create' do
      expect(post: 'api/transactions'). to route_to('api/v1/transactions#create', format: 'json')
    end
  end
end