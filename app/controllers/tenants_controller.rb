class TenantsController < ApplicationController
  
  def index
    @tenants=Tenant.all
  end

  def new
    @tenant = Tenant.new()
  end
  # def create
  #   @tenant = Tenant.new(tenant_params)

  #   if @tenant.save
  #     redirect_to @tenant, notice: 'Tenant was successfully created.'
  #   else
  #     render :new
  #   end
  # end
 def create

  
  @tenant = Tenant.new(tenant_params)
  if @tenant.save
    
    flash[:success] = "Object successfully created"
    redirect_to @tenant
  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
 end
 
 
  def show
  end

  def update
  end

  private

  def tenant_params
    params.require(:tenant).permit(:firstname, :lastname, :email, :phone, :password, :password_confirmation)
  end
  
  
end
