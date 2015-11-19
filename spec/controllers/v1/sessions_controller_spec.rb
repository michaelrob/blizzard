require 'rails_helper'

RSpec.describe V1::SessionsController, type: :controller do
  describe '#create' do
    let(:user) { create(:user) }

    context 'password correct and user present' do
      let(:params) do
        {
          user: {
            email: user.email,
            username: user.username,
            password: user.password,
            password_confirmation: user.password_confirmation
          }
        }
      end

      before :each do
        post :create, params
      end

      it 'should render user sign in' do
        expect(response.body).to include user.email
        expect(response.body).to include user.username
        expect(response.body).to include user.access_token
      end
    end

    context 'incorrect user details' do
      let(:params) do
        {
          user: {
            email: user.email,
            username: user.username,
            password: user.email
          }
        }
      end

      before :each do
        post :create, params
      end

      it 'should return error' do
        expect(response.body).to include 'sessions_controller.invalid_login_attempt'
      end
    end

    context 'user does not exist' do
      let(:params) do
        {
          user: {
            email: user.password,
            username: user.password,
          }
        }
      end

      before :each do
        post :create, params
      end

      it 'should return error' do
        expect(response.body).to include 'sessions_controller.invalid_login_attempt'
      end
    end
  end
end
