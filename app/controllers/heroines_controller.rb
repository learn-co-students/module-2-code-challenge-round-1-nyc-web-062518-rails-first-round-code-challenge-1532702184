class HeroinesController < ApplicationController
  # before_action :set_heroine, only: [:show]

  def index
    @heroines = Heroine.all
    render :index
  end

  def new
    @heroine = Heroine.new
  end



  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      flash[:notice] = "Heroine Created!"
      redirect_to heroines_path
    else
      render :new
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
    render :show
  end



private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
  # def set_heroine
  #   @heroine = Heroine.find(params[:id])
  #   #code
  # end


end
