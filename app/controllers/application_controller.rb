class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :current_tenant_log

  def current_tenant_log
    current_account ||= Tenant.find(session[:tenant_id])
    set_current_tenant(current_account)
  end
end