class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :account_id

      t.timestamps
    end
  end
end
