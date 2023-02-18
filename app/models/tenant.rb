class Tenant < ApplicationRecord
 acts_as_tenant(:account)
 has_secure_password
 belongs_to :property
 belongs_to :unit

#  def balance
#     rent_due_date = rent_due || Time.current.to_date
#     payments_total = payments.sum(:amount)
#     rent_total = (end_date_of_lease.year * 12 + end_date_of_lease.month - date_of_lease.year * 12 - date_of_lease.month + 1) * rent_amount
#     rent_due_total = (Time.current.year * 12 + Time.current.month - date_of_lease.year * 12 - date_of_lease.month) * rent_amount
#     rent_due_total -= rent_amount if Time.current.to_date > rent_due_date
#     rent_total - payments_total - rent_due_total
#   end

end
