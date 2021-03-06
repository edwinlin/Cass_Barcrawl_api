class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def create # POST /api/v1/login
    @user = User.find_by(username: user_login_params[:username])
    # @user.authenticate('password')
    byebug
    if @user && @user.authenticate(user_login_params[:password])
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def show
    jwt = request.headers['Authorization']
    # byebug
    something = jwt.split('Bearer ')
    id = JWT.decode(something[1], 'my_s3cr3t')[0]["user_id"]
    @user = User.find(id)
    render json: {user: @user}
  end

  private

  def user_login_params
    # { user: { username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:username, :password)
  end
end
