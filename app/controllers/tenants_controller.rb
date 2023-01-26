class TenantsController < ApplicationController
  skip_before_action :current_tenant_log ,only: [:edit, :update, :show, :destory,:new]
  def index
  end

  def new
  end

  def show
  end

  def update
  end
end
