class Property < ApplicationRecord
  acts_as_tenant(:account)
  has_many :units
  has_many :tenants, through: :units

  def total_rent_collected
    units.sum(:rent)
  end

  def self.for_logged_in_user
    ActsAsTenant.with_tenant(current_user.account) { all }
  end
end
