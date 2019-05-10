class Ocr::DanjuController < ActionController::API
  ALL_CODE = Rails.cache.read("all-codes")

  #存单
  def cundan
    money = Faker.between(10000, 9999999)
    id_value = System.cache_id("ocr_dj_cundan_id")

    号码1 = "99990" + rand(999).to_s
    号码2 = rand(99999999).to_s
    存入日 = Faker.birthdays(18,50)
    起息日 = 存入日-1.day
    存期 = Danju.cunqi
    到期日 = 起息日 + 存期.to_i.months
    利率 = "0." + rand(99).to_s + "00%"
    利息 = "0." + rand(99).to_s
    印密 = "凭普通密码"
    操作员 = Danju.czy + "00" + rand(99).to_s
    户名 = Faker.name
    帐号 = Faker.card_number_2
    金额大写 = Money.new.cb(money)
    金额小写 = Faker.part_number(money) + ".00"

    data = {
      id: id_value,
      号码1: 号码1,
      号码2: 号码2,
      存入日: 存入日.strftime("%Y-%m-%d"),
      起息日: 起息日.strftime("%Y-%m-%d"),
      存期: 存期,
      到期日: 到期日.strftime("%Y-%m-%d"),
      利率: 利率,
      利息: 利息,
      印密: 印密,
      操作员: 操作员,
      户名: 户名,
      帐号: 帐号,
      金额大写: 金额大写,
      金额小写: 金额小写,
    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end

  #二手车发票
  def ershoupiao
    name1 = Faker.company
    name2 = Faker.name
    name3 = Faker.company
    name4 = Faker.name
    add1 = Faker.add_city
    add2 = Faker.real_address
    money = Faker.between(10000, 9999999)
    id_value = System.cache_id("ocr_dj_ershoupiao_id")
    daima = Faker.bank_number
    haoma = "00" + 
    
    en_date_year = Faker.en_date_year
    en_date_month = Faker.en_date_month
    en_date_day = Faker.en_date_day
    code = ALL_CODE.sample
    money_num = rand(99999).to_s

    开票日期 = "#{en_date_year}年#{en_date_month}月#{en_date_day}日"
    开票日期_1 = "#{en_date_year}-#{en_date_month}-#{en_date_day}"
    发票代码 = daima
    发票号码 = haoma
    机打代码 = daima
    机打号码 = haoma
    买方单位个人 = [name1, name2].sample
    买方单位代码身份证 = Faker.id_card
    买方住址 = Faker.real_address
    买方电话 = Faker.gen_mobile
    卖方单位个人 = [name3, name4].sample
    卖方单位代码身份证 = Faker.id_card
    卖方住址 = Faker.real_address
    卖方电话 = Faker.gen_mobile
    车牌号 = Faker.plate_no
    登记证号 = Faker.bank_number
    车辆类型 = Danju.car_type
    车架号 = Faker.char_num(17)
    厂牌型号 = Faker.car_model
    转入地车辆管理所名称 = Faker.add_city + "车管所"
    车价合计大写 = Money.new.cb(money_num.to_i)
    车价合计小写 = money_num + ".00"
    二手车市场 = Faker.add_city + "二手车交易市场有限公司"
    纳税人识别号 = Faker.id_card
    纳税人地址 = Faker.real_address
    开户银行 = Faker.bank_branch + " " + Faker.card_number_2
    电话 = Faker.gen_mobile
    车辆评估值 = money_num.to_i-5432
    开票人 = Faker.name

    data = {
      id: id_value,
      开票日期: 开票日期,
      开票日期_1: 开票日期_1,
      发票代码: 发票代码,
      发票号码: 发票号码,
      机打代码: 发票代码,
      机打号码: 发票号码,
      买方单位个人: 买方单位个人,
      买方单位代码身份证: 买方单位代码身份证,
      买方住址: 买方住址,
      买方电话: 买方电话,
      卖方单位个人: 卖方单位个人,
      卖方单位代码身份证: 卖方单位代码身份证,
      卖方住址: 卖方住址,
      卖方电话: 卖方电话,
      车牌号: 车牌号,
      登记证号: 登记证号,
      车辆类型: 车辆类型,
      车架号: 车架号,
      厂牌型号: 厂牌型号,
      转入地车辆管理所名称: 转入地车辆管理所名称,
      车价合计大写: 车价合计大写,
      车价合计小写: 车价合计小写,
      二手车市场: 二手车市场,
      纳税人识别号: 纳税人识别号,
      纳税人地址: 纳税人地址,
      开户银行: 开户银行,
      电话: 电话,
      车辆评估值: 车辆评估值,
      开票人: 开票人,
    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end

  #新车发票
  def xinchepiao
    money = Faker.between(10000, 999999)
    id_value = System.cache_id("ocr_dj_xinchepiao_id")
    daima = Faker.bank_number
    haoma = rand(9999999).to_s
    leixing = Danju.car_type_new

    开票日期 = Faker.birthdays(1,20)
    发票代码 = daima
    发票号码 = haoma
    机打代码 = daima
    机打号码 = haoma
    机器编号 = Faker.bank_number
    购买方名称 = Faker.name
    购买方身份证号码 =  Faker.id_card
    车辆类型 = leixing
    厂牌型号 = Faker.car_model
    产地 = Core::City.short_name
    合格证号 = Faker.char_num(4) + Faker.number(11)
    进口证明书号 = ""
    商检单号 =  ""
    发动机号码 =  Faker.number(8)
    车辆识别号 =  Faker.char_num(10) + Faker.number(7)
    价税合计 =  Money.new.cb(money)
    小写 =  Faker.part_number(money) + ".00"
    销货单位名称 =  Faker.add_city + leixing + "销售有限公司"
    电话 =  Faker.gen_mobile
    纳税人识别号 =  Faker.number(17) + Faker.char_num(1)
    账号 =  Faker.bank_branch + " " + Faker.card_number_2
    地址 =  Faker.address
    开户银行 =  Faker.bank_branch
    增值税税率或征收率 =  "0%"
    增值税税额 =  "0.00"
    主管税务机关 =  "国家税务总局" + Faker.address + "税务局"
    主管税务机关代码 = Faker.number(9)
    不含税价 =  Faker.part_number(money) + ".00"
    完税凭证号码 =  ""
    吨位 =  "0." + rand(999).to_s
    限乘人数 =  Danju.renshu
    开票人 =  Faker.name

    data = {
      id: id_value,

      开票日期: 开票日期.strftime("%Y-%m-%d"),
      发票代码: 发票代码,
      发票号码: 发票号码,
      机打代码: 机打代码,
      机打号码: 机打号码,
      机器编号: 机器编号,
      购买方名称: 购买方名称,
      购买方身份证号码: 购买方身份证号码,
      车辆类型: 车辆类型,
      厂牌型号: 厂牌型号,
      产地: 产地,
      合格证号: 合格证号,
      进口证明书号: 进口证明书号,
      商检单号: 商检单号,
      发动机号码: 发动机号码,
      车辆识别号: 车辆识别号,
      价税合计: 价税合计,
      小写: 小写,
      销货单位名称: 销货单位名称,
      电话: 电话,
      纳税人识别号: 纳税人识别号,
      账号: 账号,
      地址: 地址,
      开户银行: 开户银行,
      增值税税率或征收率: 增值税税率或征收率,
      增值税税额: 增值税税额,
      主管税务机关: 主管税务机关,
      主管税务机关代码: 主管税务机关代码,
      不含税价: 不含税价,
      完税凭证号码: 完税凭证号码,
      吨位: 吨位,
      限乘人数: 限乘人数,
      开票人: 开票人,
    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end
 
  #合格证
  def hegeheng
      money = Faker.between(10000, 9999999)
      id_value = System.cache_id("ocr_dj_xinchepiao_id")
      en_date_year = Faker.en_date_year
      en_date_month = Faker.en_date_month
      en_date_day = Faker.en_date_day
      car_id = Faker.char_num(11)
      zhiliang = rand(1012..5432).to_s

      合格证编号 = Danju.zimu(num=3) + Faker.number(12)
      发证日期 = "#{en_date_year}年#{en_date_month}月#{en_date_day}日"
      车辆制造企业名称 = Faker.add_city + Danju.hgz_car_type + "制造有限公司"
      车辆品牌车辆名称 = Danju.hgz_car_type
      车辆品牌车辆类型 = Danju.car_type
      车辆型号 = car_id
      车辆识别代号车架号 = Faker.char_num(11) + Faker.number(6)
      车身颜色 = Danju.hgz_car_color
      底盘型号底盘ID = car_id
      底盘合格证编号 = Faker.char_num(3) + Faker.number(12)
      发动机型号 = Faker.char_num(6)
      发动机号 = rand(999999).to_s
      燃料种类 = Danju.ranliao
      排量和功率 = ""
      排放标准 = ""
      油耗 = ""
      外廓尺寸 = ""
      货厢内部尺寸 = ""
      钢板弹簧片数 = ""
      轮胎数 = ""
      轮胎规格 = ""
      轮距 = ""
      轴距 = ""
      轴荷 = ""
      轴数 = ""
      转向形式 = ""
      总质量 = zhiliang
      整备质量 = zhiliang.to_i-567
      额定载质量 = zhiliang.to_i-456
      载质量利用系数 = ""
      准牵引总质量 = ""
      半挂车鞍座最大允许总质量 = ""
      驾驶室准乘人数 = "2"
      预定载客 = ""
      最高设计车速 = ""
      车辆制造日期 = ""
      二维条码 = ""

    data = {
      id: id_value,
      
      合格证编号: 合格证编号,
      发证日期: 发证日期,
      车辆制造企业名称: 车辆制造企业名称,
      车辆品牌车辆名称: 车辆品牌车辆名称,
      车辆品牌车辆类型: 车辆品牌车辆类型,
      车辆型号: 车辆型号,
      车辆识别代号车架号: 车辆识别代号车架号,
      车身颜色: 车身颜色,
      底盘型号底盘ID: 底盘型号底盘ID,
      底盘合格证编号: 底盘合格证编号,
      发动机型号:  发动机型号,
      发动机号:  发动机号,
      燃料种类:  燃料种类,
      排量和功率:  排量和功率,
      排放标准:  排放标准,
      油耗:  油耗,
      外廓尺寸:  外廓尺寸,
      货厢内部尺寸:  货厢内部尺寸,
      钢板弹簧片数:  钢板弹簧片数,
      轮胎数:  轮胎数,
      轮胎规格:  轮胎规格,
      轮距:  轮距,
      轴距:  轴距,
      轴荷:  轴荷,
      轴数:  轴数,
      转向形式:  转向形式,
      总质量:  总质量,
      整备质量:  整备质量,
      额定载质量:  额定载质量,
      载质量利用系数:  载质量利用系数,
      准牵引总质量:  准牵引总质量,
      半挂车鞍座最大允许总质量:  半挂车鞍座最大允许总质量,
      驾驶室准乘人数:  驾驶室准乘人数,
      预定载客:  预定载客,
      最高设计车速:  最高设计车速,
      车辆制造日期:  车辆制造日期,
      二维条码:  二维条码,

    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end
  
  
  #进口凭证
  def jinkoupinzheng
    money = Faker.between(10000, 9999999)
    id_value = System.cache_id("ocr_dj_jinkoupinzheng_id")



    data = {
      id: id_value,
      


    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end


  #转账支票
  def zhipiao
    money = Faker.between(10000, 9999999)
    id_value = System.cache_id("ocr_dj_zhipiao_id")
    name1 = Faker.company
    name2 = Faker.name

    号码1 = Faker.number(8)
    号码2 = Faker.number(8)
    出票日期 = Faker.birthdays(1,15)
    付款行名称 = Faker.bank_branch
    收款人 = [name1, name2].sample
    出票人帐号 = Faker.card_number_2
    人民币大写 = Money.new.cb(money)
    人民币小写 = Faker.part_number(money) 
    用途 = "划款"
    行号 = Faker.between(111111111111, 999999999999)

    data = {
      id: id_value,
      号码1: 号码1,
      号码2: 号码2,
      出票日期: 出票日期,
      付款行名称: 付款行名称,
      收款人: 收款人,
      出票人帐号: 出票人帐号,
      人民币大写: 人民币大写,
      人民币小写: 人民币小写,
      出票人帐号: 出票人帐号,
      行号: 行号,
      


    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end




  #一致性证书
  def yizhixing
    money = Faker.between(10000, 9999999)
    id_value = System.cache_id("ocr_dj_yizhixing_id")

      车辆一致性证书编号 = Faker.char_num(13) + Faker.number(12)
      车辆生产厂名称 = ""
      车辆生产企业名称 = ""
      车型种类 = ""
      生产者制造商名 = ""
      新能源车 = ""
      车辆识别代号 = ""
      车辆识别代号打刻位 = ""
      法定标牌的位置 = ""
      车型名称 = ""
      车辆型号 = ""
      车辆注册类型 = ""
      车辆类别 = ""
      车辆品牌 = ""
      车辆颜色 = ""
      发动机编号 = ""
      发动机编号在发动机 = ""
      车辆生产企业地址 = ""
      基本车辆一致性证书 = ""
      基本车辆型号 = ""
      基本车辆类别 = ""
      本阶段车辆CCC证书编 = ""
      最终阶段车辆CCC证书 = ""
      车轴数量 = ""
      车轮数量 = ""
      驱动轴位置 = ""
      前悬 = ""
      轮距 = ""
      外廓尺寸 = ""
      轴距 = ""
      货厢内部尺寸 = ""
      牵引装置中心与车辆 = ""
      接近角 = ""
      装备质量 = ""
      额定载质量 = ""
      载质量利用系数 = ""
      准牵引总质量 = ""
      最大允许总质量 = ""
      最大允许总质量对应 = ""
      发动机型号 = ""
      直接喷射 = ""
      气缸数量和排列 = ""
      排量 = ""
      离合器 = ""
      变速器 = ""
      转向型式 = ""
      最高设计车速 = ""
      轮胎规格 = ""
      制动装置简要说明 = ""
      是否带防抱死系统 = ""
      额定载客人数 = ""
      钢板弹簧片数 = ""
      车辆制造日期 = ""
      牵引车与挂车的最大 = ""
      牵引车与挂车连接点 = ""
      车门数量和结构 = ""
      按照运输危险货物的 = ""
      速比 = ""
      主传动比 = ""
      声级 = ""
      啊CCC认证引用的标准号 = ""
      定制噪声 = ""
      加速行驶车外噪声 = ""
      排气排放物 = ""
      啊CCC认证引用的标准号 = ""
      试验用液体燃料柴油 = ""
      啊CO = ""
      啊NOx = ""
      啊HCNOx = ""
      啊THC = ""
      啊NMHC = ""
      微粒物 = ""
      烟度 = ""
      啊CO2排放量 = ""
      啊CCC认证引用的标准号 = ""
      啊CO2排放量 = ""
      市区_1 = ""
      市区_2 = ""
      市郊_1 = ""
      市郊_2 = ""
      综合_1 = ""
      综合_2 = ""
      备注 = ""


    data = {
      id: id_value,
      
      车辆一致性证书编号: 车辆一致性证书编号,
      最终阶段车辆制造国: 最终阶段车辆制造国,
      车辆生产企业名称: 车辆生产企业名称,
      车型种类: 车型种类,
      生产者制造商名: 生产者制造商名,
      新能源车: 新能源车,
      车辆识别代号: 车辆识别代号,
      车辆识别代号打刻位: 车辆识别代号打刻位,
      法定标牌的位置: 法定标牌的位置,
      车型名称: 车型名称,
      车辆型号: 车辆型号,
      车辆注册类型: 车辆注册类型,
      车辆类别: 车辆类别,
      车辆品牌: 车辆品牌,
      车辆颜色: 车辆颜色,
      发动机编号: 发动机编号,
      发动机编号在发动机: 发动机编号在发动机,
      车辆生产企业地址: 车辆生产企业地址,
      基本车辆一致性证书: 基本车辆一致性证书,
      基本车辆型号: 基本车辆型号,
      基本车辆类别: 基本车辆类别,
      本阶段车辆CCC证书编: 本阶段车辆CCC证书编,
      最终阶段车辆CCC证书: 最终阶段车辆CCC证书,
      车轴数量: 车轴数量,
      车轮数量: 车轮数量,
      驱动轴位置: 驱动轴位置,
      前悬: 前悬,
      轮距: 轮距,
      外廓尺寸: 外廓尺寸,
      轴距: 轴距,
      货厢内部尺寸: 货厢内部尺寸,
      牵引装置中心与车辆: 牵引装置中心与车辆,
      接近角: 接近角,
      装备质量: 装备质量,
      额定载质量: 额定载质量,
      载质量利用系数: 载质量利用系数,
      准牵引总质量: 准牵引总质量,
      最大允许总质量: 最大允许总质量,
      最大允许总质量对应: 最大允许总质量对应,
      发动机型号: 发动机型号,
      直接喷射: 直接喷射,
      气缸数量和排列: 气缸数量和排列,
      排量: 排量,
      离合器: 离合器,
      变速器: 变速器,
      转向型式: 转向型式,
      最高设计车速: 最高设计车速,
      轮胎规格: 轮胎规格,
      制动装置简要说明: 制动装置简要说明,
      是否带防抱死系统: 是否带防抱死系统,
      额定载客人数: 额定载客人数,
      钢板弹簧片数: 钢板弹簧片数,
      车辆制造日期: 车辆制造日期,
      牵引车与挂车的最大: 牵引车与挂车的最大,
      牵引车与挂车连接点: 牵引车与挂车连接点,
      车门数量和结构: 车门数量和结构,
      按照运输危险货物的: 按照运输危险货物的,
      速比: 速比,
      主传动比: 主传动比,
      声级: 声级,
      CCC认证引用的标准号: 啊CCC认证引用的标准号,
      定制噪声: 定制噪声,
      加速行驶车外噪声: 加速行驶车外噪声,
      排气排放物: 排气排放物,
      CCC认证引用的标准号: 啊CCC认证引用的标准号,
      试验用液体燃料柴油: 试验用液体燃料柴油,
      CO: 啊CO,
      NOx: 啊NOx,
      HCNOx: 啊HCNOx,
      THC: 啊THC,
      NMHC: 啊NMHC,
      微粒物: 微粒物,
      烟度: 烟度,
      CO2排放量: 啊CO2排放量,
      CCC认证引用的标准号: 啊CCC认证引用的标准号,
      CO2排放量: 啊CO2排放量,
      市区_1: 市区_1,
      市区_2: 市区_2,
      市郊_1: 市郊_1,
      市郊_2: 市郊_2,
      综合_1: 综合_1,
      综合_2: 综合_2,
      备注: 备注


    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end
 


  #增值税发票
  def zhengzhipiao
      money = Faker.decimal(6, 2)
      id_value = System.cache_id("ocr_dj_zhengzhipiao_id")
      en_date_year = Faker.en_date_year
      en_date_month = Faker.en_date_month
      en_date_day = Faker.en_date_day

      code = ALL_CODE.sample
      village = Core::Village.get_shourt_full_name(code)
      street = village[2].strip()
    
      aNO_1 = Faker.number(10)
      aNO_2 = Faker.number(8)
      开票日期 = "#{en_date_year}年#{en_date_month}月#{en_date_day}日"
      名称  = Faker.company
      纳税人 = Faker.id_card
      地址 = Faker.address
      开户行 = Faker.bank_branch + " " + Faker.card_number_2
      服务名称 = Faker::FAPIAO_LEIBIE.sample
      规格 = ""
      单位 = %w[升 件 个 吨 件 台].sample
      sl_list =[Faker.decimal(4, 2), Faker.decimal(4, 1), Faker.decimal(3, 2), Faker.decimal(3, 1), Faker.decimal(2, 1), Faker.number(3), Faker.number(4),  Faker.number(2),  Faker.number(1)]
      数量 =  eval("sl_list[#{Faker.between(0, 8)}]")
      单价 =  eval("sl_list[#{Faker.between(0, 8)}]")
      总金额 = 数量.to_i * 单价.to_i
      税率 = %w( 16%   10%  6%  1%   17% ).sample
      合计税额 = (总金额.to_i*税率.to_i)*0.01
      合计金额 = 总金额 - 合计税额
      价税合计小写 = 总金额
      价税合计大写 = Money.new.cb(money.to_f)
      销名称 = Faker.company
      销纳税人识别码 = Faker.id_card

      销地址 = street
      销开户行 =  Faker.bank_branch
      备注 = ""
      收款人 = Faker.name
      复核 = Faker.name
      开票人 = Faker.name

    data = {
      id: id_value,
      NO_1: aNO_1,
      NO_2: aNO_2,
      开票日期: 开票日期,
      名称: 名称,
      纳税人: 纳税人,
      地址: 地址,
      开户行: 开户行,
      服务名称: 服务名称,
      规格: 规格,
      单位: 单位,
      数量: 数量,
      单价: 单价,
      总金额: 总金额, 
      合计金额: 合计金额,
      税率: 税率,
      合计税额: 合计税额,
      价税合计大写: 价税合计大写,
      价税合计小写: 价税合计小写,
      销名称: 销名称,
      销纳税人识别码: 销纳税人识别码,
      销地址: 销地址,
      销开户行: 销开户行,
      备注: 备注,
      收款人: 收款人,
      复核: 复核,
      开票人: 开票人

    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end

end
