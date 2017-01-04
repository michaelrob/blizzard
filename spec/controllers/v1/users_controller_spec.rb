require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do

  describe '#create' do
    let(:params) do
      {
        user: {
          email: 'user_one@exaple.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    context 'user successful' do
      it 'should create new user and return success' do
        expect { post :create, params }.to change { User.count }.by(1)
        expect(response.body).to include 'access_token'
      end
    end

    context 'user unsuccessful' do
      before do
        params[:user][:password_confirmation] = 'wrong_password'

        post :create, params
      end

      it 'should return user_create_error json' do
        expect(response).to_not have_http_status :success
        expect(response.body).to include 'translation missing: en.user_create_error'
      end
    end
  end

end
