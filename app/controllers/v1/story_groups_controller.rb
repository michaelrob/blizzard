module V1
  class StoryGroupsController < ApplicationController

    def index
      @story_groups = StoryGroup.includes(:user).order(created_at: :desc).all
      render json: @story_groups, each_serializer: StoryGroupSerializer
    end

    def create
      @story_group = StoryGroup.new(story_group_params)

      if @story_group.save
        render json: @story_group, serializer: StoryGroupSerializer
      else
        render json: { error: t('story_group_create_error') }, status: :unprocessable_entity
      end
    end

    def show
      @story_group = StoryGroup.find(params[:id])
      render json: @story_group, serializer: StoryGroupSerializer
    end

private
    def story_group_params
      params.require(:story).permit(:title, :description).merge(user: current_user)
    end
  end
end
