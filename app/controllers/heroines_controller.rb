class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]

  def index
    @heroines = Heroine.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      flash[:notice] = "Heroine successfully created!"
      redirect_to @heroine
    else
      render :new
    end
  end

  private

  def set_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
