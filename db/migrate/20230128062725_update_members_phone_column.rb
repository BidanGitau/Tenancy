class UpdateMembersPhoneColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :members, :phone, 'integer USING CAST(phone AS integer)'
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
