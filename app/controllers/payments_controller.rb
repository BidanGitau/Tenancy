class PaymentsController < ApplicationController
    def new
      @payment = Payment.new
    end
  
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
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
      params.require(:payment).permit(:amount, :date_paid, :unit_id, :tenant_id)
    end
  end
  