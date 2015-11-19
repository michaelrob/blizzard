require 'rails_helper'

RSpec.describe V1::SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe '#create' do
    context 'password correct and user present' do
      it 'should sign_in user' do
        pending
      end

      it 'should render user sign in' do
        pending
      end
    end

    it 'should return error if no user exists' do
      pending
    end

    it 'should return error if password incorrect' do
      pending
    end
  end
end
