class Account < ApplicationRecord
  belongs_to :user
  has_many :tenants
  has_many :properties
end
