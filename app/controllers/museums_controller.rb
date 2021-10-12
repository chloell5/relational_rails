class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
  end

  def new
  end

  def create
  end

  def show
    @museum = Museum.find(params[:id])
  end

  def edit
  end
end
