require 'rails_helper'

RSpec.describe V1::StoryGroupsController, type: :controller do
  let(:user) { create(:user) }

  describe '#index' do
    let(:story_group) { create(:story_group, user: user) }
    let(:story) { create(:story, user: user, story_group: story_group) }

    context 'authorized' do
      let!(:authorization) { request.headers['Authorization'] = user.access_token }

      # before do
      #   story
      #   get :index
      # end

      it 'should return all story groups for user' do
        expect(response.body).to include story_group.id.to_s
        expect(response.body).to include story_group.title
      end
    end

    context 'not authorized' do
      before do
        get :index
      end

      it 'should return unauthorized error' do
        expect(response.body).to include 'translation missing: en.application_controller.unauthorized'
      end
    end
  end

  describe '#create' do
    let(:params) do
      {
        story: {
          title: 'new story title',
          description: 'Story description',
        }
      }
    end

    context 'authorized user' do
      let!(:authorization) { request.headers['Authorization'] = user.access_token }

      it 'should create new story group' do
        expect { post :create, params }.to change { StoryGroup.count }.by(1)
        expect(response.body).to include 'new story title'
        expect(response.body).to include 'Story description'
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
  end
end
