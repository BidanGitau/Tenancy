class PagesController < ApplicationController
  skip_before_action :current_tenant_log,only: [:home]

    def home
    end
    def index
       if logged_user?
        if session[:tenant_id]
          @tenant=current_tenant_log
        end
       end
    end
    
end