class Property < ApplicationRecord
  acts_as_tenant(:account)
  has_many :units
 has_many :tenants
  def self.for_logged_in_user
    ActsAsTenant.with_tenant(current_user.account) do
      all
    end
  end
end
