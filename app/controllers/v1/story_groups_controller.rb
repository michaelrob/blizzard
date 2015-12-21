module V1
  class StoryGroupsController < ApplicationController

    def create
      @story_group = StoryGroup.new(story_params)

      if @story_group.save
        render json: @story_group, serializer: StoryGroupSerializer
      else
        render json: { error: t('story_group_create_error') }, status: :unprocessable_entity
      end
    end

private
    def story_params
      params.require(:story).permit(:title, :description)
    end
  end
end
