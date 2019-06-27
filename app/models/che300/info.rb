class Che300::Info < ApplicationRecord
    serialize :remark, Hash

    def base_info
        { 类别: remark[:a], 车型: remark[:b], 车系: remark[:c], 型号: model_list(remark[:d]) }
    end

    def model_list(data)
        arr = []

        arr_list = data.split(";")

        arr_list.each do |item|
            itarr = item.split(",")
            arr << {
                model: itarr[0],
                money: itarr[1],
            }
        end
        arr
    end
end
