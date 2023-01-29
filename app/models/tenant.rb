class Tenant < ApplicationRecord
  acts_as_tenant(:user)
   has_many :members, dependent: :destroy
   validates_uniqueness_of :name 
end
