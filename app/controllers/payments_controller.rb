class PaymentsController < ApplicationController
  before_action :set_unit
    def index
      @payments = Payment.where(unit_id: params[:unit_id])
      @unit = Unit.find(params[:unit_id])

    end
    
    def new
      @payment_types = Payment.payment_types
      @payment = Payment.new
     
      @unit = Unit.find(params[:unit_id])
      @tenant = @unit.tenant
      # @payments = Payment.where(unit_id: params[:unit_id])
      # @last_payment = @unit.payments.where(tenant_id: @tenant.id).order(date: :desc).first
      # @last_payment_date = @last_payment.date if @last_payment.present?

    end
   
   
    def create
      
      
      
      
      @payment = Payment.new(payment_params)
      if @payment.save
      @payment.update(date_paid: Date.today)
        redirect_to @payment.unit, notice: "Payment was successfully created."
      else
        render :new
      end
    end
  
    def edit
      @payment = Payment.find(params[:id])
    end
  
    def update
      @payment = Payment.find(params[:id])
      if @payment.update(payment_params)
        redirect_to @payment.unit, notice: "Payment was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @payment = Payment.find(params[:id])
      @payment.destroy
      redirect_to @payment.unit, notice: "Payment was successfully deleted."
    end
  
    private
  
    def payment_params
      params.require(:payment).permit(:amount, :payment_method,:notes, :unit_id, :tenant_id)
    end
    def set_unit
      @units = Unit.find(params[:unit_id])
    end
  end
  