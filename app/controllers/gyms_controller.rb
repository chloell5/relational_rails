class GymsController < ApplicationController

  def index
    @gyms = Gym.all
  end

  def show
    @gyms = Gym.find(params[:id])
  end

end
