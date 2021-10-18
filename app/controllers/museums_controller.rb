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

    redirect_to "/museums/#{museum.id}"
  end

  def show
    @museum = Museum.find(params[:id])
  end

  def destroy
    museum = Museum.find(params[:id])
    museum.destroy!

    redirect_to '/museums'
  end
end
