class AddAccountToTenants < ActiveRecord::Migration[7.0]
  def change
    add_column :tenants, :account_id, :integer
    add_index :tenants, :account_id
  end
end
