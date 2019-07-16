class SystemsController < ApplicationController
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
    @system.user_id = session[:user_id]
    binding.pry
    if @system.valid?
      @system.save
      redirect_to @system
    else
      render :new
    end
  end

  def update
    if @system.user_id != session[:user_id]
      @error = "Can't do that, it's not yours"
      @systems = System.all
      render :index
    elsif @system.update(observation_params)
      redirect_to @system
    else
      render :edit
    end
  end

  def destroy
    @system.destroy
    redirect_to systems_path
  end

  private
    def set_system
      @system = System.find(params[:id])
    end

    def system_params
      params.fetch(:system, {})
    end
end
