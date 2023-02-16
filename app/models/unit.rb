class Unit < ApplicationRecord
  
    belongs_to :property, class_name: "Property"
     has_one :tenant

     
     def assign_tenant(tenant)
        update(status: 'occupied')
       update(tenant_id: tenant.id)
      end
end
