class Property < ApplicationRecord
  acts_as_tenant(:account)
  has_many :units
  has_many :tenants, through: :units

#  def self.rent_paid
#     units.joins(:payments).sum(:amount)
#      end

#   def self.balance
#     rent - rent_paid
#   end

  def self.for_logged_in_user
    ActsAsTenant.with_tenant(current_user.account) do
      all
    end
  end
end
