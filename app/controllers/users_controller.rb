class UsersController < ApplicationController
  before_action :layout_models
  before_action :set_user, only: [:show]
  before_action :authentication_required, only: [:show]

  def app
  end

  def show
    respond_to do |f|
      f.html
      f.json { render json: @user }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to app_path
    else
        render :new
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
  end
end
