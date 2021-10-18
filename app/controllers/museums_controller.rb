class MuseumsController < ApplicationController
  def index
    @museums = Museum.all.order_created
  end

  def new; end

  def create
    Museum.create!(
      name: params[:name],
      free_admission: params[:free_admission],
      donation_revenue: params[:donation_revenue]
    )

    redirect_to '/museums'
  end

  def edit
    @museum = Museum.find(params[:id])
  end

  def update
    museum = Museum.find(params[:id])
    
    museum.update(
      name: params[:name],
      free_admission: params[:free_admission],
      donation_revenue: params[:donation_revenue]
    )

    redirect_to "/museums/#{params[:id]}"
  end

  def show
    @museum = Museum.find(params[:id])
  end
end
