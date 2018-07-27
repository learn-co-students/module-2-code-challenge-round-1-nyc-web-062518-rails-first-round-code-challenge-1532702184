class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]

  def index
    @heroines = Heroine.all
  end

  def show

  end

  def new
    @heroine = Heroine.new
    render :new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      flash[:notice] = 'Heroine has been created'
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
