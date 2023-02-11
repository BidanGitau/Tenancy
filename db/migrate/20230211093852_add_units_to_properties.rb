class AddUnitsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :units, :property, null: false, foreign_key: true
    
  end
end
