class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :rent
      t.integer :tenant_id

      t.timestamps
    end
  end
end
