require 'rails_helper'

RSpec.describe V1::StoriesController, type: :controller do

  describe '#create' do
    let(:params) do
      {
        story: {
          title: 'new story title',
          body: 'Story description',
        }
      }
    end

    context 'story successful' do
      it 'should create new user and return new user information' do
        expect { post :create, params }.to change { Story.count }.by(1)
      end
    end

    context 'story unsuccessful' do
      before do
        params[:story][:body] = nil

        post :create, params
      end

      it 'should return user_create_error json' do
        expect(response).to_not have_http_status :success
        expect(response.body).to include 'translation missing: en.story_create_error'
      end
    end
  end

  describe '#index' do

  end

  describe '#show' do

  end

end
