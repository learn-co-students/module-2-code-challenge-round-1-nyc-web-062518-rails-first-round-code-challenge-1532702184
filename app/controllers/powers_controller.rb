class PowersController < ApplicationController

    before_action :set_power, only: [:show, :edit]

  def index
    @powers = Power.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_power
    @power = Power.find(params[:id])
  end


end
