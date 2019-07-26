class SystemsController < ApplicationController
  layout "main"
  before_action :layout
  before_action :set_system, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def index
    @systems = System.all
  end

  def show
  end

  def new
    @system = System.new
  end

  def edit
  end

  def create
    @system = System.new(system_params)
    if @system.save
      redirect_to @system
    else
      render :new
    end
  end

  def update
    if @system.observation.user_id != session[:user_id]
      flash[:notice] = "Can't do that, it's not yours"
      @systems = System.all
      render :index
    elsif @system.update(system_params)
      redirect_to @system
    else
      render :edit
    end
  end

  def destroy
    if @system.observation.user_id != session[:user_id]
      flash[:notice] = "Can't do that, it's not yours"
      render :index
    else 
      @system.destroy
      redirect_to observation_path(@system.observation)
    end
  end

  private
    def set_system
      @system = System.find(params[:id])
    end

    def system_params
      params.require(:system).permit(:name, :observation_id)
    end
end
