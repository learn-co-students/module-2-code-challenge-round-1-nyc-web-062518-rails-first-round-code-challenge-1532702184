#Had extra time, so for the show page for each power, I added links to each Heroine who has that power.

class PowersController < ApplicationController

  before_action :set_power, only: [:show]

  def index
    @powers = Power.all
  end

  def show
  end

  def set_power
    @power = Power.find_by(id: params[:id])
  end
end
