class AddcolumntoTenants < ActiveRecord::Migration[7.0]
  def change
    rename_column :tenants, :name, :firstname
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    add_column :tenants, :lastname, :integer
    add_column :tenants, :phone, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
