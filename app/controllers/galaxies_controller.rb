class GalaxiesController < ApplicationController
  layout "main"
  before_action :layout_models
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required
  
  def index
    @galaxies = Galaxy.all
  end

  def show
  end

  def new
    @galaxy = Galaxy.new
  end

  def edit
  end

  def create
    @observation = Observation.find(params[:galaxy][:observation_id])
    @galaxy = Galaxy.new(galaxy_params)
    @observation.galaxy = @galaxy

    if @galaxy.save && @observation.save
      redirect_to @galaxy
    else
      render :new
    end
  end

  def update
      if !can_edit?(@galaxy)
        flash[:notice] = "Can't do that, it's not yours"
        render :index
      elsif @galaxy.update(galaxy_params)
        redirect_to @galaxy
      else
        render :edit
      end
  end

  def destroy
    if !can_edit?(@galaxy)
      flash[:notice] = "Can't do that, it's not yours"
      render :index
    else
      @galaxy.destroy
      redirect_to user_path(session[:user_id])
    end
  end

  private
    def set_galaxy
      @galaxy = Galaxy.find(params[:id])
    end

    def galaxy_params
      params.require(:galaxy).permit(:name)
    end
end
