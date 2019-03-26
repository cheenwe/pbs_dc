class Faker
    Numbers = Array(0..9)
    ULetters = Array('A'..'Z')
    Letters = ULetters + Array('a'..'z')

    DATA = YAML.load_file("#{Rails.root}" + "/config/faker.yml")['ocr']

    COMPANY_PREFIX = Faker::DATA["company"]["prefix"]
    COMPANY_SUFFIX = Faker::DATA["company"]["suffix"]

    NAME_XING = Faker::DATA["name"]["xing"]
    NAME_MING = Faker::DATA["name"]["ming"]

    BANK_NAME = Faker::DATA["bank"]["bank_name"]
    BANK_BRANCH = Faker::DATA["bank"]["bank_name"]

    ADD_STARTE = Faker::DATA["address"]["state"]
    ADD_STATE = Faker::DATA["state"]
    ADD_PREFIX = Faker::DATA["address"]["city_prefix"]
    ADD_SUFFIX = Faker::DATA["address"]["city_suffix"]


    SINGLE_NAME = Faker::DATA["single"]["name"]
    SINGLE_COMPANY = Faker::DATA["single"]["company"]
    SINGLE_BANK = Faker::DATA["single"]["bank"]
    SINGLE_CITY = Faker::DATA["single"]["city"]

    OPERATE_SCOPE = Faker::DATA["operate_scope"]
    MINZU = Faker::DATA["minzu"]
    LPN_STRFF=["京A","京C","京E","京F","京H","京G","京B", "津A","津B", "津C", "津E", "沪A", "沪B", "沪D", "沪C", "沪F", "渝A", "渝B", "渝C", "渝G", "渝H", "冀A", "冀B", "冀C", "冀D", "冀E", "冀F", "冀G", "冀H", "冀J", "冀R", "冀T", "豫A", "豫B", "豫C", "豫D", "豫E", "豫F","豫G","豫H","豫J","豫K","豫L","豫M","豫N","豫P","豫Q","豫R","豫S","豫U" ,"云A", "云C", "云D", "云E", "云F", "云G","云H","云J","云K","云L","云M","云N","云P","云Q","云R ","云S", "辽A", "辽B", "辽C", "辽D", "辽E", "辽F","辽G","辽H","辽J","辽K","辽L","辽M","辽N","辽P","辽V", "黑A", "黑B", "黑C", "黑D", "黑E", "黑F","黑G","黑H","黑J","黑K","黑L","黑M","黑N","黑P","黑R", "湘A", "湘B", "湘C", "湘D", "湘E", "湘F","湘G","湘H","湘J","湘K","湘L","湘M","湘N","湘U","湘S", "皖A", "皖B", "皖C", "皖D", "皖E", "皖F","皖G","皖H","皖J","皖K","皖L","皖M","皖N","皖P","皖Q","皖R","皖S", "鲁A", "鲁B", "鲁C", "鲁D", "鲁E", "鲁F","鲁G","鲁H","鲁J","鲁K","鲁L","鲁M","鲁N","鲁P","鲁Q","鲁R","鲁S","鲁U","鲁V","鲁Y", "新A", "新B", "新C", "新D", "新E", "新F","新G","新H","新J","新K","新L","新M","新N","新P","新Q","新R", "苏A", "苏B", "苏C", "苏D", "苏E", "苏F","苏G","苏H","苏J","苏K","苏L","苏M","苏N", "浙A", "浙B", "浙C", "浙D", "浙E", "浙F","浙G","浙H","浙J","浙K ","浙L", "赣A","赣B","赣C","赣D","赣E","赣F","赣G","赣H","赣J","赣K","赣L","赣M", "鄂A","鄂B","鄂C","鄂D","鄂E","鄂F","鄂G","鄂H","鄂J","鄂K" ,"鄂L","鄂M","鄂N","鄂P","鄂Q","鄂R","鄂S", "桂A","桂B","桂C","桂D","桂E","桂F","桂G","桂H","桂J","桂K","桂L","桂M","桂N","桂P" ,"桂R", "甘A","甘B","甘C","甘D","甘E","甘F","甘G","甘H","甘J","甘K","甘L","甘M" ,"甘N","甘P", "晋A" ,"晋B","晋C","晋D","晋E","晋F","晋H","晋J","晋K","晋L","晋M", "蒙A","蒙B","蒙C","蒙D","蒙E","蒙F","蒙G","蒙H","蒙J","蒙K","蒙L","蒙M", "陕A","陕B","陕C","陕D","陕E","陕F","陕G","陕H","陕J","陕K","陕U","陕V", "吉A","吉B","吉C","吉D","吉E","吉F","吉G","吉H","吉J", "闽A","闽B","闽C","闽D","闽E","闽F" ,"闽G","闽H","闽J","闽K", "贵A","贵B" ,"贵C","贵D","贵E" ,"贵F","贵G","贵H","贵J", "粤A","粤B","粤C","粤D","粤E","粤F","粤G","粤H","粤J","粤K","粤L","粤M","粤N","粤P","粤Q","粤R","粤S","粤T","粤U","粤V","粤W","粤X","粤Y","粤Z", "青A","青B","青C","青D","青E","青F","青G","青H", "藏A","藏B","藏C","藏D","藏E","藏F","藏G","藏H" ,"藏J", "川A","川B","川C","川D","川E","川F","川H","川J","川K","川L","川M","川Q","川R","川S","川T","川U","川V","川W","川X","川Y","川Z", "宁A","宁B","宁C","宁D", "琼A","琼B","琼C","琼D","琼E"]
    LPN_END=%w(挂 学 警 军 港 澳)

    VEHICLE_TYPE =  %w(轿车 大型轿车 小型轿车 微型轿车 小型普通客车 中型普通客车 大型普通客车 重型普通货车 重型厢式货车 重型自卸货车 中型封闭货车 中型集装厢车 中型自卸货车 轻型普通货车 轻型厢式货车 轻型自卸货车 微型普通货车 微型厢式货车 微型自卸货车 重型普通半挂车 中型普通半挂车 轻型普通半挂车 重型普通全挂车 中型普通全挂车)
    USE_NATURE = %w(营运 公路客运 公交客运 出租客运 旅游客运 租赁 教练 货运 危化品运输 非营运 警用 消防 救护 工程救险 营转非 出租转非)
    CAR_MODEL = %w(奥迪 宝马 奔驰 保时捷 宝沃 大众 捷达 卡尔曼 smart 西雅特  本田 丰田 雷克萨斯 铃木 马自达 讴歌 日产 斯巴鲁 三菱 五十铃 英菲尼迪 起亚 双龙 现代 别克 道奇 福特 Faraday Future GMC Jeep 凯迪拉克 克莱斯勒 林肯 特斯拉 雪佛兰 欧系其他 标致 DS 雷诺 雪铁龙 阿斯顿·马丁 宾利 捷豹 路虎 劳斯莱斯 路特斯 MINI 迈凯伦 阿尔法·罗密欧 布加迪 菲亚特 法拉利 兰博基尼 玛莎拉蒂 依维柯 国能汽车 Polestar 沃尔沃 斯柯达  爱驰 ARCFOX 宝骏 比亚迪 奔腾 比速 北汽绅宝 北汽幻速 北汽威旺 北汽昌河 北汽制造 北汽道达 北汽新能源 北京 拜腾 长安汽车 长安欧尚 长安轻型车 长安跨越 长城 大乘汽车 东风风度 东风风光 东风风神 东风风行 东风富康 东风小康 东风 东风·瑞泰特 东南 电咖 福迪 福汽启腾 福田 广汽传祺 广汽新能源 观致 国金 哈弗 海马 汉腾 红旗 华泰 红星汽车 黄海 华骐 华颂 吉利 江淮 捷途 江铃 奇点汽车 金杯 金龙 九龙 君马 钧天汽车 凯翼 开瑞 卡升 卡威 领克 陆风 力帆 猎豹 零跑汽车 领途汽车 理念 理想智造 名爵 哪吒汽车 纳智捷 欧尚汽车 欧拉 奇瑞 启辰 前途 庆铃 全球鹰 荣威 SWM斯威 思皓 上汽大通 腾势 天际汽车 五菱 WEY 蔚来 潍柴英致 威马汽车 小鹏汽车 星驰 星途 新特汽车 驭胜 野马 一汽 裕路 云度 云雀汽车 众泰 中华 知豆 之诺 中兴)
    FAPIAO_LEIBIE = %w(*石油制品*   货物 劳务 服务 无形资产 不动产 未发生销售行为的不征税项目  农业类产品 林业类产品 牧业类产品 渔业类产品 矿产品 食品类产品 饮料类产品 烟类产品 酒类产品 纺织类产品 服装类产品 皮革类产品 木制品 家具类产品 纸类产品 印刷品 软件 文教 工艺品类产品 石油 化工 医药产品 金属及非金属制品 机械 设备类产品 电力 热力 水类产品 燃气类产品 加工劳务 修理修配劳务 油气田企业为生产原油 天然气提供的生产性劳务 矿产资源开采 挖掘 切割 破碎 分拣 洗选等劳务 交通运输服务费 邮政服务费 电信服务费 现代服务费 建筑服务费 金融服务费 生活服务费 技术服务费 商标 著作权 商誉 自然资源使用权 其他权益性无形资产 建筑物 构筑物 其他不动产 预付卡销售和充值 销售自行开发的房地产项目预收款 已申报缴纳营业税未开票补开票)
    # 
    # PLATE_CHARS_PROVINCE = {"京", "沪", "津", "渝", "冀", "晋", "蒙", "辽", "吉", "黑",
    # "苏", "浙", "皖", "闽", "赣", "鲁", "豫", "鄂", "湘", "粤",
    # "桂", "琼", "川", "贵", "云", "藏", "陕", "甘", "青", "宁",
    # "新"}
    PLATE_CHARS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N","P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    

    class << self 
      

      def char_num(num=5)
        Faker::PLATE_CHARS.sample(num).join("")
      end

      # 车牌号码
      def plate_no
        LPN_STRFF.sample + PLATE_CHARS.sample(5).join("")
      end

      # 车牌号码
      def vehicle_type
        VEHICLE_TYPE.sample
      end

      def use_nature
        USE_NATURE.sample
      end

      def car_model
        CAR_MODEL.sample+ "/"+PLATE_CHARS.sample(8).join("")
      end

      
 

      # 民族
      def minzhu
        # %w()
        MINZU.sample
      end
 
      #营业执照经营范围
      def gen_scope
        return  OPERATE_SCOPE.sample
      end

      # Faker.single_all
      def single_all
        as=[]
        as << SINGLE_NAME
        as << SINGLE_COMPANY
        as << SINGLE_BANK
        as << SINGLE_CITY
        return as.flatten!.uniq
      end

      #name
      def name
          arr = %w(2 1)
          size = arr.sample(1)[0].to_i

          xing = NAME_XING.sample
          ming = NAME_MING.sample(size).join("")
          return  "#{xing}#{ming}"
      end

      #company
      def company
          prefix = COMPANY_PREFIX.sample
          suffix = COMPANY_SUFFIX.sample
          return  "#{prefix}#{suffix}"
      end


      #bank
      def bank
          bank_name = BANK_NAME.sample
          return  "#{bank_name}"
      end

      #bank_branch
      def bank_branch
          branch = BANK_BRANCH.sample
          city_prefix = ADD_PREFIX.sample
          city_suffix = ADD_SUFFIX.sample
          return  "#{branch}#{city_prefix}#{city_suffix}支行"
      end

      #branch
      def address
        state = ADD_STARTE.sample
        city_prefix = ADD_PREFIX.sample
        city_suffix = ADD_SUFFIX.sample
        return  "#{state}#{city_prefix}#{city_suffix}"
      end

      #二手车市场
      def add_city
        city_prefix = ADD_PREFIX.sample
        city_suffix = ADD_SUFFIX.sample
        return  "#{city_prefix}#{city_suffix}"
      end

      #真实地址
      def real_address
        code = Rails.cache.read("all-codes").sample
        village = Core::Village.get_shourt_full_name(code)[2].strip
        return  "#{village}"
      end

      # card_number_1
      def card_number_1
          rand(999999999999999999).to_s
      end

      # card_number_2
      def card_number_2
          rand(999999999999999999).to_s
      end

      # bank_number
      def bank_number
          rand(999999999999).to_s
      end

      #  protocol_number
      def  protocol_number
          rand(9999999999999999).to_s
      end

      # Generates a random value between the interval
      def between(from = 1.00, to = 5000.00)
        from, to = to, from if to < from
        rand(from..to)
      end


      ## by default numerify results do not start with a zero
      def numerify(number_string, leading_zero: false)
        return number_string.gsub(/#/) { rand(10).to_s } if leading_zero

        number_string.sub(/#/) { rand(1..9).to_s }.gsub(/#/) { rand(10).to_s }
      end

      def letterify(letter_string)
        letter_string.gsub(/\?/) { sample(ULetters) }
      end

      def bothify(string)
        letterify(numerify(string))
      end

      # number
      def number(digits = 10)
        num = ''

        if digits > 1
          num = non_zero_digit
          digits -= 1
        end

        num + (1..digits).collect { digit }.join
      end

      def leading_zero_number(digits = 10)
        '0' + (2..digits).collect { digit }.join
      end

      def decimal_part(digits = 10)
        num = ''
        if digits > 1
          num = non_zero_digit
          digits -= 1
        end
        leading_zero_number(digits) + num
      end


      def normal(mean = 1, standard_deviation = 1)
        theta = 2 * Math::PI * rand
        rho = Math.sqrt(-2 * Math.log(1 - rand))
        scale = standard_deviation * rho
        mean + scale * Math.cos(theta)
      end
 
      def within(range = 1.00..5000.00)
        between(range.min, range.max)
      end

      def positive(from = 1.00, to = 5000.00)
        random_number = between(from, to)

        greater_than_zero(random_number)
      end

      def negative(from = -5000.00, to = -1.00)
        random_number = between(from, to)

        less_than_zero(random_number)
      end


      def decimal(l_digits = 5, r_digits = 2)
        l_d = number(l_digits)
        r_d = decimal_part(r_digits)

        "#{l_d}.#{r_d}"
      end

      def non_zero_digit
        rand(1..9).to_s
      end

      def digit
        rand(10).to_s
      end
      
      #  千位分隔符 
      def part_number(number)
        p number
        left, right = number.to_s.split(".")
        left =  add_sign(left)
        p left
        [left, right].compact.join(".")
      end


      # ============================================
      # id_card
      #随机生成身份证号码

      SHENG_NO = %w(11 12 13 14 15 21 22 23 31 32 33 34 35 36 37 41 42 43 44 45 46 50 51 52 53 54 61 62 63 64 65 71 81 82 91)
      LAST = %w(1 0 X 9 8 7 6 5 4 3 2)

      def id_card
        date = birthday(3, 95).delete("-")
        sex = Random.new.rand(1..2)
        s1 = "#{SHENG_NO.sample(1)[0]}#{number(2)}#{number(2)}#{date}#{number(2)}#{sex}"
        m = 0
        (0..16).each do |i|
          m = m + s1[i].to_i
        end
        return  "#{s1}#{LAST[m % 11]}"
      end


      def gen_id_card(code, date)
        sex = Random.new.rand(1..2)
        s1 = "#{code}#{date}#{number(2)}#{sex}"
        m = 0
        (0..16).each do |i|
          m = m + s1[i].to_i
        end
        return  "#{s1}#{LAST[m % 11]}"
      end

      # ============================================
      #cn_date
      def cn_date
        mdigit = ['零', '壹', '贰', '叁', '肆','伍', '陆', '柒', '捌', '玖']
        date = birthday(3, 95).delete("-")
        data = ""
        date.each_char(){ |c| data= data+ mdigit[c.to_i]}
        return data
      end

      # ============================================
      #cn_date
      def cn_date_year
        mdigit = ['零', '壹', '贰', '叁', '肆','伍', '陆', '柒', '捌', '玖']
        date = birthday(3, 95).split("-")[0]
        data = ""
        date.each_char(){ |c| data= data+ mdigit[c.to_i]}
        return data
      end

      # ============================================
      #cn_date
      def cn_date_month
        mdigit = ['零', '壹', '贰', '叁', '肆','伍', '陆', '柒', '捌', '玖']
        date = birthday(3, 95).split("-")[1]
        data = ""
        date.each_char(){ |c| data= data+ mdigit[c.to_i]}
        return data
      end

      # ============================================
      #cn_date
      def cn_date_day
        mdigit = ['零', '壹', '贰', '叁', '肆','伍', '陆', '柒', '捌', '玖']
        date = birthday(3, 95).split("-")[2]
        data = ""
        date.each_char(){ |c| data= data+ mdigit[c.to_i]}
        return data
      end

      #日期补全, 1位数字前加 0 
      def month_num_fix(num)
        if num.size == 1
          return '零'+num
        else
          num 
        end  
      end

      #日期补全, 十位数位数字前加 0 
      def cn_date_day_fix(num)
        if num.size == 1
          return '零'+num
        elsif num =="壹拾" || num =="贰拾" ||  num =="叁拾"
          return '零'+num
        else
          num 

        end  
      end

      # ============================================
      #en_date
      def en_date_year
        return birthday(0, 95).split("-")[0]
      end

      # ============================================
      #en_date
      def en_date_month
        return birthday(3, 95).split("-")[1]
      end

      # ============================================
      #en_date
      def en_date_day
        return birthday(3, 95).split("-")[2]
      end

      # ============================================
      # 1[3|4|5|7|8]
      #随机生成手机号码
      PHONE_SIGN = %w(3 4 5 7 8)
      def gen_mobile
        s1 = "1#{PHONE_SIGN.sample(1)[0]}#{number(2)}#{number(2)}#{number(2)}#{number(2)}#{number(1)}"
        return   s1
      end


      # ============================================
      # date

      def max_date(date=Date.today, y=5)
        from = date - y.year
        to   = date
        between(from, to).strftime("%Y-%m-%d")
      end

      def date(m=0)
        from = ::Date.today + 1
        to   = ::Date.today + m.year
        between(from, to).strftime("%Y-%m-%d")
      end

      # Faker.new.birthday(15)
      def birthday(min_age = 1, max_age = 3)
        t = ::Date.today

        from = birthday_date(t, max_age)
        to   = birthday_date(t, min_age)

        between(from, to).strftime("%Y-%m-%d")
      end


      # Faker.new.birthday(15,75)
      def birthdays(min_age = 1, max_age = 3)
        t = ::Date.today

        from = birthday_date(t, max_age)
        to   = birthday_date(t, min_age)

        between(from, to)
      end


      def birthday_date(date, age)
        year = date.year - age

        day =
          if date.day == 29 && date.month == 2 && !::Date.leap?(year)
            28
          else
            date.day
          end

        ::Date.new(year, date.month, day)
      end

      private


      # 每隔N个字符添加一个符号
      def add_sign(number, sign=",")
        number.to_s.reverse.scan(/.{1,3}/).join(sign).reverse
      end

      def greater_than_zero(number)
        should_be(number, :>)
      end

      def less_than_zero(number)
        should_be(number, :<)
      end

      def should_be(number, method_to_compare)
        if number.send(method_to_compare, 0)
          number
        else
          number * -1
        end
      end
    end



end
