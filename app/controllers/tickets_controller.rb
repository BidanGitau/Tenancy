class TicketsController < ApplicationController
  before_action :current_tenant
  def index
    @tickets=Ticket.all
  end

  def new
    @ticket=Ticket.new
  end

  def show
  end

  def create
   
 
   
    @ticket=Ticket.new(ticket_params)
    if  @ticket.save
      ActsAsTenant.current_tenant=Tenant.first
      redirect_to tickets_path
      flash[:notice]="successfully created"
    else
      render 'new'
      flash[:notice]=" not successfully created"
    end  
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title,:description)
  end
end
