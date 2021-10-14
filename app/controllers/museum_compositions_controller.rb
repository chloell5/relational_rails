class MuseumCompositionsController < ApplicationController
  def index
    @museum = Museum.find(params[:id])
    @compositions = @museum.compositions
  end
end
