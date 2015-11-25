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
  end
end
