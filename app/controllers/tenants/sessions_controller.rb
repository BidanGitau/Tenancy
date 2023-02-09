class Tenants::SessionsController < Devise::SessionsController
    skip_before_action :authenticate_user! 
    skip_before_action :configure_permitted_parameters
   
    before_action :logout_user
    
  
     
    def new
      @tenant = Tenant.find_by(email: params[:email])
      if @tenant.nil?
        flash[:error] = "Email not found"
        render :new
      elsif !@tenant.authenticate(params[:password])
        flash[:error] = "Incorrect password"
        render :new
      elsif !@tenant.active
        flash[:error] = "Tenant account is not active"
        render :new
      else
        # log the tenant in and redirect to the appropriate page
      end
    end
  
    private
  
    def logout_user
      sign_out(:user) if user_signed_in?
    end
  end
  