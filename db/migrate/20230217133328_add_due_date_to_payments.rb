class AddDueDateToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :due_date, :date
  end
end
