class Unit < ApplicationRecord
  
    belongs_to :property, class_name: "Property"
     has_one :tenant
      has_many :payments
    
     
     def assign_tenant(tenant)
        update(status: 'occupied')
       update(tenant_id: tenant.id)
      end
end
