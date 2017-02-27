module V1
  class ProjectsController < ApplicationController

    def show
    end

    def create
    end

private
    def project_params
      params.require(:project).permit(:title, :description).merge(user: current_user)
    end
  end
end