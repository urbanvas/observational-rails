class GalaxiesController < ApplicationController
  before_action :layout_models
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def life
    @galaxies = Galaxy.life_exists?
    render :index
  end
  
  def index
    @galaxies = Galaxy.all
    respond_to do |f|
      f.html 
      f.json { render json: @galaxies }
    end
  end

  def show
  end

  def new
    @galaxy = Galaxy.new
  end

  def edit
  end

  def create
    @galaxy = Galaxy.find_or_create_by(id: params[:galaxy][:id])
    if @galaxy.id == nil
      @galaxy = Galaxy.new(galaxy_params)
    end
    @observation = Observation.find(params[:galaxy][:observation_id])

 
    if @observation.user_id != session[:user_id]
      flash[:notice] = "Can't do that, it's not yours"
      @observations = Observation.all
      render 'observations/index'
    elsif @galaxy.save
      @observation.galaxy = @galaxy
      @observation.save
      # redirect_to @galaxy
      render json: @galaxy
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
      params.require(:galaxy).permit(:name, :life, :classification, :color)
    end
end
