class GalaxiesController < ApplicationController
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
    @galaxy = Galaxy.new(galaxy_params)
    if @galaxy.valid?
      @galaxy.save
      redirect_to @galaxy
    else
      render :new
    end
  end

  def update
    if @galaxy.observation_id != session[:user_id]
      @error = "Can't do that, it's not yours"
      @galaxys = Galaxy.all
      render :index
    elsif @galaxy.update(galaxy_params)
      redirect_to @galaxy
    else
      render :edit
    end
  end

  def destroy
    if @galaxy.observation_id != session[:user_id]
      @error = "Can't do that, it's not yours"
      @galaxys = Galaxy.all
      render :index
    else 
      @galaxy.destroy
      redirect_to galaxys_path
    end
  end

  private
    def set_galaxy
      @galaxy = Galaxy.find(params[:id])
    end

    def galaxy_params
      params.require(:galaxy).permit(:name, :observation_id)
    end
end
