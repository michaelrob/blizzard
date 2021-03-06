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

      it 'should return story_create_error json' do
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

  describe '#show' do
    let(:story) { create(:story, user: user) }

    context 'authorized' do
      let!(:authorization) { request.headers['Authorization'] = user.access_token }

      before do
        get :show, id: story.id
      end

      it 'should return specific story for user' do
        expect(response.body).to include story.id.to_s
        expect(response.body).to include story.title
        expect(response.body).to include story.body
      end
    end

    context 'not authorized' do
      before do
        get :show, id: story.id
      end

      it 'should return unauthorized error' do
        expect(response.body).to include 'translation missing: en.application_controller.unauthorized'
      end
    end
  end
end
