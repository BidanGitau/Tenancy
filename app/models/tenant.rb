class Tenant < ApplicationRecord
  acts_as_tenant(:user)
  has_secure_password
     validates_uniqueness_of :name 
end
