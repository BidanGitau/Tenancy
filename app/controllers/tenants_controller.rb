class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
    @properties = Property.all
  end

  def new
    @tenant = Tenant.new()
    @properties = Property.all
    @units = Unit.all
    #  @units = Unit.where(property_id: params[:property_id])
  end

  def create
    @tenant = Tenant.new(tenant_params)
    @property = Property.find(params[:tenant][:property_id])
    @unit = @property.units.find(params[:tenant][:unit_id])
    @unit.tenant = @tenant # assign the tenant to the unit
    if @tenant.save && @unit.save
      @unit.update(tenant_id: @tenant.id, status: "occupied")
      redirect_to @tenant
    else
      render "new"
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(
      :firstname,
      :lastname,
      :email,
      :deposit,
      :date_of_lease,
      :rent_amount,
      :end_date_of_lease,
      :phone,
      :password,
      :password_confirmation,
      :property_id,
      :unit_id,
    )
  end
end
