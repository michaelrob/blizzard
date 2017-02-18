module V1
  class StorySerializer < ActiveModel::Serializer

    attributes :id, :title, :body, :user_id, :assigned, :priority, :tags
  end
end
