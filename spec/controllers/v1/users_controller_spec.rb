require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do

  describe '#create' do
    let(:params) do
      {
        user: {
          email: 'user_one@exaple.com',
          username: 'user',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    context 'user successful' do
      before do
        post :create, params
      end

      it 'should return successful user json' do
        expect(response).to have_http_status :success
      end
    end

    context 'user unsuccessful' do
      before do
        params[:user][:password_confirmation] = 'wrong_password'

        post :create, params
      end

      it 'should return user_create_error json' do
        expect(response).to_not have_http_status :success
      end
    end
  end

end
