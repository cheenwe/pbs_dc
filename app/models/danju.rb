class Danju

    #车型
    CAR_TYPE =  %w(微型轿车 小型轿车 紧凑型轿车 级轿 中高级轿车 高级轿车 跑车 小型SUV 紧凑型SUV 中性SUV 大中型SUV 全尺寸SUV MPV 微型客车 小型客车 中型客车 大型客车 微型面包车 皮卡 微型货车 轻型货车 中型客车 重型货车 普通半挂车 仓栅半挂车 箱式半挂车)
    CAR_TYPE_NEW =  %w(多用途乘用车 轿车 运动型乘用车 混合动力轿车 小轿车 客车 越野车 普通乘用车 活顶乘用车 高级乘用车 小型乘用车 敞篷车 舱背乘用车 旅行车 短头乘用车 越野乘用车 专用乘用车 货车 半挂牵引车)
    HEGEZHENG_CAR =  %w(上海大众 一汽大众 上海通用 上汽公司 北京现代 北京吉普 北京戴克 东南汽车 长丰猎豹 广汽丰田 广汽本田 一汽丰田 天津丰田 四川丰田 解放牌 一汽轿车 一汽马自达 海马汽车 江淮汽车 吉利华普 长安汽车 长安铃木 长安福特 长安沃尔沃 昌河铃木 奇瑞汽车 华泰汽车 华晨汽车 华晨宝马 东风汽车,通用汽车 福特汽车 克莱斯勒 宝马 奔驰戴克 三菱 马自达 丰田 雷克萨斯 本田 富士 日产 雪铁龙 标志 欧宝 萨博 大众奥迪 雷诺 兰博基尼 劳斯莱斯 沃尔沃)
    HEGEZHENG_COLOR =  %w(白 红 黑 灰 银 棕 黄)
    RANLIAO =  %w(柴油 汽油)

    class << self
        #存期月数
        def cunqi
            %w(12 24 36 48 60 72).sample 
        end
        #操作员代码
        def czy
            %w(A B C).sample 
        end
        #二手车型
        def car_type
            CAR_TYPE.sample
        end
        #新车车型
        def car_type_new
            CAR_TYPE_NEW.sample
        end
        #合格证车辆类型
        def hgz_car_type
            HEGEZHENG_CAR.sample
        end
        #合格证车辆颜色
        def hgz_car_color
            HEGEZHENG_COLOR.sample
        end
        #燃料种类
        def ranliao
            RANLIAO.sample
        end
        #限乘人数
        def renshu
            %w(2 3 4 5 6 7 8 10).sample 
        end
        #随机字母
        def zimu(num=5)
            ('A'..'Z').to_a.sample(num).join
        end



    end
end


