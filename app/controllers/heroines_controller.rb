#Had extra time and wanted to implement full CRUD suite for the Heroine model. For the sake of brevity, in the routes.rb file, I gave the heroines route all resources, while keeping the powers route limited to :index and :show.

class HeroinesController < ApplicationController

  before_action :set_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all
    if params[:search]
      @heroines = Heroine.select {|heroine| heroine.power.name.include?(params[:search])}
    end
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def search
    @heroines = Heroine.where()
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      render :new
    end
  end

  def edit
  end

  def update
    @heroine.update(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      render :edit
    end
  end

  def destroy
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def set_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
