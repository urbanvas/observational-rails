class ObservationsController < ApplicationController
  before_action :layout_models
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def index
    if params[:galaxy_id] && Galaxy.find_by(id: params[:galaxy_id])
      @observations = Galaxy.find_by(id: params[:galaxy_id]).observations
    elsif request.path_info.include?("users")
      @observations = User.find(params[:user_id]).observations
    else
      @observations = Observation.all
    end
    respond_to do |f|
      f.html 
      f.json { render json: @observations }
    end
  end

  def show
    respond_to do |f|
      f.html 
      f.json { render json: @observation }
    end
  end

  def new
    @observation = Observation.new
  end

  def edit
  end

  def create
    @observation = Observation.new(observation_params)
    @observation.user_id = session[:user_id]
    if @observation.save
      # redirect_to @observation
      render json: @observation 
    else
      # render json: @observation
      # flash.now[:notice] = 'Unfortunately failed to sent'
      head 422
      # render :new
    end
  end

  def update
      if @observation.user_id != session[:user_id]
        flash[:notice] = "Can't do that, it's not yours"
        @observations = Observation.all
        render :index
      elsif @observation.update(observation_params)
        redirect_to @observation
      else
        render :edit
      end
  end

  def destroy
    if @observation.user_id != session[:user_id]
      flash[:notice] = "Can't do that, it's not yours"
      @observations = Observation.all
      render :index
    else 
      if @observation.galaxy
        @observation.galaxy.destroy
      end
      @observation.destroy
      redirect_to user_path(session[:user_id])
    end
  end

  private
    def set_observation
      @observation = Observation.find(params[:id])
    end

    def observation_params
        params.require(:observation).permit(:name, :user_id)
    end
end
