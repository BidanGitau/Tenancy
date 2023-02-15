class Unit < ApplicationRecord
    belongs_to :property
     has_one :tenant
end
