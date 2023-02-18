class PaymentsController < ApplicationController
  before_action :set_unit
    def index
      @payments = Payment.where(unit_id: params[:unit_id])
      @unit = Unit.find(params[:unit_id])

    end
    
    def new
      @unit = Unit.find(params[:unit_id])
      @payment_types=Payment.payment_types
      @payment = @unit.payments.new
      @tenant = @unit.tenant
  
    
    end
  
    def create
      
      
      
      @unit = Unit.find(params[:unit_id])
      @tenant =  @unit.id
      @payment = @unit.payments.new(payment_params)
     
  
      if @payment.save
        redirect_to unit_path(@unit), notice: 'Payment was successfully created.'
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
      params.require(:payment).permit(:amount, :date_paid,:payment_method,:notes, :unit_id, :tenant_id)
    end
    def set_unit
      @units = Unit.find(params[:unit_id])
    end
  end
  