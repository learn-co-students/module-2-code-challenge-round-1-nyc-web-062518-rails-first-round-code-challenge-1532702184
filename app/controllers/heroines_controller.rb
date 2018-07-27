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
    @heroine.power = Power.find(params[:power][:id].to_i)
    #I'm not 100% sure why I needed to do it like this, something went wrong with my dropdown menu, which I'm not too familiar with. The docs for it were not great either. I only managed to still create a power by looking through the bugs and the HTML code, so this is probably a pretty ugly solution.
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else
      render :new
    end
  end

  def search
  end

  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power)
  end


end
