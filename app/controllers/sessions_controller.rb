class SessionsController < ApplicationController

  def new
  end

  def create
      if auth_hash
        @user = User.find_or_create_by_omniauth(auth_hash)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      elsif @user = User.find_by(username: params[:username])
          if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            flash[:notice] = "Can't do that, with that information"
            render :new
          end
      else
        flash[:notice] = "Can't do that, with that information"
        render :new
      end
  end


  def destroy
      reset_session
      redirect_to login_path
  end

  def auth_hash
      request.env['omniauth.auth']
  end
end