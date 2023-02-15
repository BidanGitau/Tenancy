class Tenant < ApplicationRecord
 acts_as_tenant(:account)
 has_secure_password
 belongs_to :property
end
