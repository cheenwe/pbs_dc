class Car::One_param < ApplicationRecord
    establish_connection("development".to_sym)
    # self.table_name = 'tingshouchexings'  
    self.table_name = 'one_car_param'
end
