class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    if params[:power]
      @power = Power.find_by(name: params[:power])
      @heroines = Heroine.where('power_id LIKE ?', "#{@power.id}")
    else
      @heroines = Heroine.all
    end
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(params.require(:heroine).permit(:name, :super_name, :power_id, :power))
    if @heroine.valid?
      @heroine.save
      flash[:notice] = "New heroine successfully create!"
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end
end
