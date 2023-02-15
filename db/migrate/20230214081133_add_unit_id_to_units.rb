class AddUnitIdToUnits < ActiveRecord::Migration[7.0]
  def change
    def change
      add_index :units, :unit_id, unique: true
    end
  end
end
