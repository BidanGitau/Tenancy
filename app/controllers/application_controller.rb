class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_current_account
  helper_method :set_current_account

  def set_current_account
    return unless current_user.present?
    current_account = current_user.account
    ActsAsTenant.current_tenant = current_account
  end
  def after_sign_in_path_for(_resource)
    dashboard_path() # Redirects to the user's dashboard page
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: %i[firstname lastname])
    devise_parameter_sanitizer.permit(
      :user_update,
      keys: %i[firstname lastname],
    )
  end

  private

  def calculate_rent_collected(property)
    units = property.units.includes(:tenant)
    rent_collected = {}

    units.each do |unit|
      total_collected = 0

      unit.leases.each do |lease|
        total_collected += lease.payments.sum(:amount)
      end

      rent_collected[unit.number] = total_collected
    end

    rent_collected
  end
end
