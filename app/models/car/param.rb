class Car::Param < ApplicationRecord
    establish_connection("development".to_sym)
    # self.table_name = 'tingshouchexings'  
    self.table_name = 'car_params'
end
