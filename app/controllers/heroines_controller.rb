class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
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
      flash[:success] = "Good luck on your super adventure!"
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      render :new
    end
  end

  def destroy
    @heroine = Heroine.find(params[:id])
    @heroine.destroy
    flash[:destroy] = "Your Super Heroine has been deleted."
    redirect_to heroines_path
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
