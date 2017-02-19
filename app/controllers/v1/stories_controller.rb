module V1
  class StoriesController < ApplicationController

    def index
      @stories = Story.includes(:user).order(created_at: :desc).all
      render json: @stories, each_serializer: StoriesSerializer
    end

    def show
      @story = Story.find(params[:id])
      render json: @story, serializer: StorySerializer

      # need some add something to check permissions for the user
    end

    def create
      @story = Story.new(story_params)

      if @story.save
        render json: @story, serializer: StorySerializer
      else
        render json: { error: t('story_create_error') }, status: :unprocessable_entity
      end
    end

    def add_to_group
      @story = Story.find(params[:id])

      # need to fleah this out
    end

private
    def story_params
      params.require(:story).permit(:title, :body).merge(user: current_user)
    end
  end
end
