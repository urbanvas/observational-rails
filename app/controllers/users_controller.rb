class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        render :new
    end
  end

  def update
    if @user.update(user_params)
        session[:user_id] = @user.id
        redirect_to user_path
    else
        render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to '/'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :search)
  end
end
