class PlanetsController < ApplicationController
  layout "main"
  before_action :layout
  before_action :set_planet, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def index
    @planets = Planet.all
  end

  def show
  end

  def new
    @planet = Planet.new
  end

  def edit
  end

  def create
    @planet = Planet.new(planet_params)
    if @planet.save
      redirect_to @planet
    else
      render :new
    end
  end

  def update
    if @planet.observation.user_id != session[:user_id]
      flash[:notice] = "Can't do that, it's not yours"
      @planets = Planet.all
      render :index
    elsif @planet.update(planet_params)
      redirect_to @planet
    else
      render :edit
    end
  end

  def destroy
    if @planet.observation.user_id != session[:user_id]
      flash[:notice] = "Can't do that, it's not yours"
      render :index
    else 
      @planet.destroy
      redirect_to observation_path(@planet.observation)
    end
  end

  private
    def set_planet
      @planet = Planet.find(params[:id])
    end

    def planet_params
      params.require(:planet).permit(:name, :life, :observation_id, :system_id)
    end
end
