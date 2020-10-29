class Car::All_car < ApplicationRecord
    establish_connection("development".to_sym)
    # self.table_name = 'tingshouchexings'  
    self.table_name = 'all_car'
end
