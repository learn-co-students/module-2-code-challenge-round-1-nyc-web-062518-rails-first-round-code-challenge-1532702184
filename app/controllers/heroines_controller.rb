class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all

    # BONUS STUFF
    if params[:q]
      @heroine = Heroine.search(params[:search]).order("created_at DESC")
    else
      @heroine = Heroine.all.order("created_at DESC")
    end
    # END BONUS STUFF

  end

  def show
    render :show
  end

  def new
    @heroine = Heroine.new
    render :new
  end

  def create
    @heroine = Heroine.new(set_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private

  def set_params
    params.require(:heroine).permit(:name, :super_name, :power_id)

    # THIS IS THE STRONG PARAMS TO TRY AND ALLOW THE SEARCH THROUGH
    # params.require(:heroine).permit(:name, :super_name, :power_id, :q)
  end

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end


end
