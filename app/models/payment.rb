class Payment < ApplicationRecord
    belongs_to :tenant
    belongs_to :unit
  
       def self.payment_types
          ['Credit Card', 'Bank Transfer', 'Cash', 'Cheque']
        end

        # def set_due_date
        #   if self.tenant.present?
        #     start_date = self.tenant.date_of_lease 
        #     end_date = self.tenant.end_date_of_lease
        #     duration = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month) + 1
        #     months = (0..duration-1).map { |i| start_date.advance(months: i) }
        #     month_index = self.month - 1
        #     self.due_date = months[month_index].end_of_month
        #   end
        # end
        
end