class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show_current]

  def index
    @users = User.all

    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.messages }, status: 400
    end
  end

  def update
  end

  def show_current
    @user = current_user

    render json: @user
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end