class HeroinesController < ApplicationController
  def index
    if params[:power_name]
      @heroines = Heroine.all.select do |heroine|
         heroine.power_name == params[:power_name]
      end
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :power_name)
  end

end
