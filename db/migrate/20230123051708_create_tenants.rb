class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :email
      t.string :tenant_id

      t.timestamps
    end
  end
end
