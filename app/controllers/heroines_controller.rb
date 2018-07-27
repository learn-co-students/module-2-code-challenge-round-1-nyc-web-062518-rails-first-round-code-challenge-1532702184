class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    # render :index
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
    # render :show
  end

  def new
    @heroine = Heroine.new
    # render :new
  end

  def create

    @power = Power.find_by(id: params[:heroine][:power_id])
    @heroine = @power.heroines.new(heroine_params)
    # byebug
    #I would do the flash[:notice] but at this point im too lazy :(
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name)
  end
end
