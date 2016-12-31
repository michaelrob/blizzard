require 'rails_helper'

RSpec.describe V1::StoryBoardsController, type: :controller do
  let(:user) { create(:user) }

  describe '#create' do
    let(:params) do
      {
        story: {
          title: 'new story title',
          description: 'Story description',
        }
      }
    end
  end
