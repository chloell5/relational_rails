class ClassesController < ApplicationController

  def index
    @class = Classes.all
  end

end
