class UnitsController < ApplicationController
  def index
    @units=Unit.all
  end

  def new
    @unit = Unit.new
    @properties = Property.all
  end
  
  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      redirect_to properties_path
    else
      render 'new'
    end
  end
  
  private
  
  def unit_params
    params.require(:unit).permit(:name, :bedrooms, :bathrooms, :rent, :property_id)
  end
  

  def show
    @units = Unit.find(params[:id])
  end
end
