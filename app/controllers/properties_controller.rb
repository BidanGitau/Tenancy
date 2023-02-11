class PropertiesController < ApplicationController
  def new
  end

  def index
    @properties=Property.all
  end

  def show
    @property = Property.find(params[:id])
    @units = @property.units

  end

  def edit
  end
end
