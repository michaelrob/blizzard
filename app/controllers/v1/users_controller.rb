module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:create]

    def create
      @user = User.new user_params

      @user.save ? user_save : user_error
    end

private
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

    def user_save
      render json: @user, serializer: V1::SessionSerializer, root: nil
    end

    def user_error
      render json: { error: t('user_create_error') }, status: :unprocessable_entity
    end
  end
end
