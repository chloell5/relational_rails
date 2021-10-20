class GymActivitiesController < ApplicationController
  def index
    @gym = Gym.find_by(id: params[:id])
    @activities = @gym.activities
    if params[:sort] == "alph"
      @activities = @gym.activities.sort_alphabetically
    end
    if params[:max_num]
      @activities = @gym.activities.filter_by_max_number(params[:max_num])
    end 
  end

  def new
    @gym = Gym.find(params[:id])
  end

  def create
    @gym = Gym.find(params[:id])
    activity = @gym.activities.create!(activity_params)
    redirect_to "/gyms/#{@gym.id}/activities"
  end

  def show
  end

  private

    def activity_params
      params.permit(:name, :day, :time, :drop_in, :max_number)
    end

end
