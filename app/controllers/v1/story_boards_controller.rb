module V1
  class StoryBoardsController < ApplicationController

    def create
      @story_board = StoryBoard.new(story_params)

      if @story_board.save
        render json: @story_board, serializer: StoryBoardSerializer
      else
        render json: { error: t('story_board_create_error') }, status: :unprocessable_entity
      end
    end

private
    def story_params
      params.require(:story).permit(:title, :description)
    end
  end
end
