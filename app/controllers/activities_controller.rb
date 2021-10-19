class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to "/activities/#{@activity.id}"
  end

  private

    def activity_params
      params.permit(:name, :day, :time, :max_number, :drop_in)
    end
end
