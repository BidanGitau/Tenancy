class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :location
      t.string :type
      t.string :category
      t.integer :units
      t.string "tenant_id"
      t.timestamps
    end
  end
end
