class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
  end

  def show
    @composition = Composition.find(params[:id])
  end
end
