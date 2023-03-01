class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
  def new
    @property = Property.new()
  end
  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "Object successfully created"
      redirect_to @property
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
    @property = Property.find(params[:id])
    @total_rent_collected = @property.total_rent_collected
    @units = @property.units
    @tenants = []
    @units.each { |unit| @tenants << unit.tenant if unit.tenant }
  end

  private

  def property_params
    params.require(:property).permit(
      :name,
      :location,
      :property_type,
      :category,
      :no_units,
    )
  end
end
