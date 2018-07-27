class HeroinesController < ApplicationController

  before_action :set_heroine, only: [:show, :edit]

  def index
    @heroines = Heroine.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    # byebug
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      @error = @heroine.errors.full_messages.last
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end


end
