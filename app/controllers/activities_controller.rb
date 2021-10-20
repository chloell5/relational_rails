class ActivitiesController < ApplicationController
  def index
    @activities = Activity.drop_in_true

  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to "/activities/#{@activity.id}"
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to '/activities'
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

    def activity_params
      params.permit(:name, :day, :time, :max_number, :drop_in)
    end
end
