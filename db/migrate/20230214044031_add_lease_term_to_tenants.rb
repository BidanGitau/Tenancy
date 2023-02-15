class AddLeaseTermToTenants < ActiveRecord::Migration[7.0]
  def change
    add_column :tenants, :date_of_lease, :date
    add_column :tenants, :rent_amount, :integer
    add_column :tenants, :deposit, :integer
    add_column :tenants, :rent_due, :date
    add_column :tenants, :lease_term, :string
    add_column :tenants, :end_date_of_lease, :date

  end
end
