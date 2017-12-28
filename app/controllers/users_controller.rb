class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # or GET /users?nickname=something
  def index
    if params[:nickname]
      @users = User.where(nickname: params[:nickname])
    else
      @users = User.where(loggedin: true)
    end

    render jsonapi: @users
  end

  # GET /users/1
  def show
    render jsonapi: @user
  end

  # POST /users
  def create
    # won't create a new user when one already exists with the submitted data,
    #  instead it will return the already existing user
    @user = User.find_or_create_by(user_params)

    if @user.save
      ActionCable.server.broadcast 'users',
        id: @user.id,
        nickname: @user.nickname,
        loggedin: @user.loggedin

      render jsonapi: @user, status: :created, location: @user
    else
      render jsonapi_errors: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      ActionCable.server.broadcast 'users',
        id: @user.id,
        nickname: @user.nickname,
        loggedin: @user.loggedin

      render jsonapi: @user
    else
      render jsonapi_errors: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:data).require(:attributes).permit(:nickname, :loggedin)
    end
end
