class Tenant < ApplicationRecord
 acts_as_tenant(:account)
 has_secure_password
    
end
