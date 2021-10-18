class MuseumCompositionsController < ApplicationController
  def index
    @museum = Museum.find(params[:id])
    @compositions = @museum.compositions
    @compositions = @museum.order_compositions if params[:order]
    @compositions = @compositions.over_year(params[:earliest_year_made]) if params[:earliest_year_made]
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
