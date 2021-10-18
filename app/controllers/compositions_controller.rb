class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
  end

  def new; end

  def show
    @composition = Composition.find(params[:id])
  end

  def edit
    @composition = Composition.find(params[:id])
  end

  def update
    composition = Composition.find(params[:id])

    composition.update(
      name: params[:name],
      artist: params[:artist],
      on_display: params[:on_display],
      year_made: params[:year_made]
    )

    redirect_to "/compositions/#{composition.id}"
  end
end
