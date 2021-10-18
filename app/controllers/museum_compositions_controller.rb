class MuseumCompositionsController < ApplicationController
  def index
    @museum = Museum.find(params[:id])
    @compositions = @museum.compositions
  end

  def new
    @museum = Museum.find(params[:id])
  end

  def create
    @museum = Museum.find(params[:id])

    Composition.create!(
      name: params[:name],
      artist: params[:artist],
      on_display: params[:on_display],
      year_made: params[:year_made],
      museum_id: @museum.id
    )

    redirect_to "/museums/#{@museum.id}/compositions"
  end
end
