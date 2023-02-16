class Unit < ApplicationRecord
  
    belongs_to :property, class_name: "Property"
     has_one :tenant
end
