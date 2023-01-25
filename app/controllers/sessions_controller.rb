class SessionsController < ApplicationController
  skip_before_action :current_tenant_log, only:[:new,:create]
 
  def new
  end

  def create
    
   
    
    tenant=Tenant.find_by(email: params[:sessions][:email].downcase)
     if tenant
      session[:tenant_id]=tenant.id
      redirect_to tickets_path
      flash[:notice]="new progress"
      
     else
      render 'new'
      flash[:notice]="new progress not found"
     end
   
  end
    def destroy
     session[:tenant_id]=nil
      flash[:success] = 'Object was successfully deleted.'
       redirect_to root_path
  
  end
  

end
