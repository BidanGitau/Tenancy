class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable,:invitable
         has_one :account
         has_many :invitations, class_name: 'Tenant', as: :invited_by

         
         def set_account
          self.build_account
        end
end
