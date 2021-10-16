class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activities = Activity.find(params[:id])
  end
end
