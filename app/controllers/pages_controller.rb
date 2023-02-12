class PagesController < ApplicationController
 before_action :authenticate_user!,only: [:index]
 before_action :set_current_account,only: [:index]

    def home
        if set_current_account && authenticate_user!
            redirect_to dashboard_path
           end
    end
    def index
        @units=Unit.all
        @properties=Property.all
    end
    
end