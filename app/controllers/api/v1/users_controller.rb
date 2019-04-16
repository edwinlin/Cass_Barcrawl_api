class Api::V1::UsersController < ApplicationController
  before_action :set_user!, only: [:update, :destroy]
  skip_before_action :authorized, only: [:index, :create, :show]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    @users = User.all
    render json: @users
  end

  def create
    byebug
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end
  #
  # def destroy
  #   @user.destroy
  # end

# Private helper methods
  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :latitude, :longitude)
  end

  def set_user!
    @user = User.find(params[:id])
  end

end
