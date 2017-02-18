module V1
  class StoriesSerializer < ActiveModel::Serializer

    attributes :title, :created_at, :description, :id, :assigned, :priority, :tags
    has_one :user, serializer: V1::UserSerializer

    def description
      object.body[0..200]
    end
  end
end
