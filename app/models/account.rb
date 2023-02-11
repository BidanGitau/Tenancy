class Account < ApplicationRecord
  belongs_to :user
  has_many :tenants
  has_many :properties
  has_many :units, through: :properties
end
