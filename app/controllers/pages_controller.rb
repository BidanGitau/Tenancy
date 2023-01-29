class PagesController < ApplicationController
 before_action :authenticate_user!,only: [:index]
 before_action :set_current_account,only: [:index]

    def home
    end
    def index
       
    end
    
end