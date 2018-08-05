require 'rails_helper'

RSpec.describe 'Api::V1::UsersController', type: :controller do
  before { @controller = Api::V1::UsersController.new }

  let(:valid_attributes) do
    { sender_number: '07033245678', pass_code: '1234',
      time: DateTime.current, service_provider: 'PhilMobile' }
  end

  let(:invalid_attributes) do
    { sender: '08109367559', phone_number: '30403020342' }
  end

  let(:existing_account_attribs) do
    { sender_number: '07033245678', pass_code: '1234',
      time: DateTime.current, service_provider: 'PhilMobile' }
  end

  describe 'Get #index' do
    it 'return a success response' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      @user = User.create! valid_attributes
      get :show, params: { id: @user.id }
      json = JSON.parse(response.body)
      expect(response).to be_success
    end
  end

  describe 'Post #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'does not create a new user' do
        post :create, params: { user: invalid_attributes }
        expect(response.status).to be(422)
        json = JSON.parse(response.body)
        expect(json).to have_key('sender_number')
      end
    end
  end

  describe 'PuT #update' do
    let(:new_attributes) do
      { sender_number: '09067567812', pass_code: '1234',
        time: DateTime.current, service_provider: 'PhilMobile' }
    end

    context 'with valid params' do
      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }
        expect(response.status).to be(201)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'edit\' template)' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, params: { id: user.to_param }
      end.to change(User, :count).by(-1)
    end
  end
end
