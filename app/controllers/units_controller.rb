class UnitsController < ApplicationController
  def show
    @units = Unit.find(params[:id])
  end
  def index
    @account = current_user.account
    # @units = @account.properties.joins(:units).distinct.select("units.*")
    @units = @account.properties.joins(units: :tenant)
                            .distinct
                            .select("units.*, tenants.firstname AS tenant_firstname, tenants.lastname AS tenant_lastname")


    @properties = @account.properties
  end

  # def index
  #       @properties = Property.all
  #       @units=Unit.all
  # end

  def new
    @unit = Unit.new
    @properties = Property.all
  end
  
  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      property = @unit.property
      rentals=property.no_units
      property.update(no_units:rentals.to_i + 2)
      redirect_to properties_path
    else
      render 'new'
    end
  end
  
  def search
    property_name = params[:property_name]
    @units = Unit.joins(:property).where('properties.name LIKE ?', "%#{property_name}%")
  end

  private
  
  def unit_params
    params.require(:unit).permit(:name, :bedrooms, :bathrooms, :rent, :property_id)
  end
  

 
end
