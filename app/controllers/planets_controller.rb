class PlanetsController < ApplicationController
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
    if @planet.valid?
      @planet.save
      redirect_to @planet
    else
      render :new
    end
  end

  def update
    if @planet.observation_id != session[:user_id]
      @error = "Can't do that, it's not yours"
      @planets = Planet.all
      render :index
    elsif @planet.update(planet_params)
      redirect_to @planet
    else
      render :edit
    end
  end

  def destroy
    if @planet.observation_id != session[:user_id]
      @error = "Can't do that, it's not yours"
      @planets = Planet.all
      render :index
    else 
      @planet.destroy
      redirect_to planets_path
    end
  end

  private
    def set_planet
      @planet = Planet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planet_params
      params.require(:planet).permit(:name, :life, :observation_id, :system_id)
    end
end
