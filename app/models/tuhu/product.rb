class Tuhu::Product < ApplicationRecord
    # kind_id 火花塞 空调滤清器  机油滤清器  空气滤清器 燃油滤清器
    has_many :product_details
    has_many :details, through: :product_details

    def check_kind
        {
            "火花塞": 1,
            "空调滤清器": 2,
            "机油滤清器": 3,
            "空气滤清器": 4,
            "燃油滤清器": 5,
        }
    end
    # Tuhu::Product.new.kind_check[:"#{}"]
    def kind_check
        {
            "1": "火花塞",
            "2": "空调滤清器",
            "3": "机油滤清器",
            "4": "空气滤清器",
            "5": "燃油滤清器",
        }
    end
end
