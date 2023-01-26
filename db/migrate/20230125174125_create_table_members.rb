class CreateTableMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.text :name
      t.string :email
      t.string :phone
      t.string :tenant_id

      t.timestamps
    end
  end
end
