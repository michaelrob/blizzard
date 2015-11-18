require 'rails_helper'

RSpec.describe V1::StoriesController, type: :controller do
  let(:user) { create(:user) }

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
      let!(:authorization) { request.headers['Authorization'] = user.access_token }

      it 'should create new story and return success' do
        expect { post :create, params }.to change { Story.count }.by(1)
      end
    end

    context 'story unsuccessful' do
      let!(:authorization) { request.headers['Authorization'] = user.access_token }
      
      before do
        params[:story][:body] = nil

        post :create, params
      end

      it 'should return user_create_error json' do
        expect(response).to_not have_http_status :success
        expect(response.body).to include 'translation missing: en.story_create_error'
      end
    end

    context 'unauthorized user' do
      before do
        post :create, params
      end

      it 'should return unauthorized error' do
        expect(response.body).to include 'translation missing: en.application_controller.unauthorized'
      end
    end
  end

  describe '#index' do

  end

  describe '#show' do

  end

end
