class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
  end

  def new
  end

  def create
  end

  def show
    @composition = Composition.find(params[:id])
  end

  def edit
  end
end
