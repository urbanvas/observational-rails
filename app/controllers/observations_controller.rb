class ObservationsController < ApplicationController
  layout "main"
  before_action :layout_models
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def index
      @observations = Observation.all
  end

  def show
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
      redirect_to @observation
    else
      render :new
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
      @observation.galaxy.destroy
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
