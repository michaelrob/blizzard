module V1
  class StorySerializer < ActiveModel::Serializer

    attributes :id, :title, :body, :user_id, :story_group_id

  end
end
