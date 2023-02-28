class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :invitable
  has_one :account

  before_validation :set_account

  def set_account
    self.build_account
  end

  def send_invitation_to(tenant)
    tenant.update(password: SecureRandom.hex(8))
    TenantMailer.invitation(tenant, self, tenant.password).deliver_later
  end
end
