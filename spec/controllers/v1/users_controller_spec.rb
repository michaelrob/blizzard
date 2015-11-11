require 'rails_helper'

RSpec.describe UsersController do

  describe '#create' do
    context 'user successful' do
      let(:user) { create(:user) }

      it 'should return successful user json' do
        # do things
        binding.pry
      end
    end

    context 'user unsuccessful' do
      it 'should return user_create_error json' do
        # do things
      end
    end
  end

end
