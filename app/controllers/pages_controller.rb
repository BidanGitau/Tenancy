class PagesController < ApplicationController
  skip_before_action :current_tenant_log,only: [:home]

    def home
    end
    def index
        
    end
    
end