require "chinese_pinyin"
class OcrController < ActionController::API

  ALL_CODE = Core::Village.new.read_or_write_all_code #Rails.cache.read("all-codes").present??  Rails.cache.read("all-codes"):Core::Village.new.write_cache

  HZZZZ = %w(枚 洇 异 递 寥 鄚 粥 蜜 过 萱 玫 龄 厅 享 绳 呈 邰 砬 档 擦 算 烧 候 纺 巽 漠 黛 侧 补 屺 犀 卖 仫 意 咽 箴 苔 个 笮 颡 披 砚 域 琏 湫 珉 凫 冼 筵 笕 歹 踅 知 蟒 铃 唱 沩 夼 缝 拥 驷 髻 卦 郡 求 洗 淝 扒 鸦 责 炬 蔓 仇 绸 琚 鹚 狗 洧 厉 及 驶 稠 雾 郾 崎 著 鸬 卷 俭 萩 伽 典 伞 瓢 憨 模 谏 夫 秣 励 铭 净 茄 棕 磴 戎 辟 免 坚 萝 坍 秉 标 旸 伴 优 兆 钩 埌 磻 阮 粉 哲 逢 琪 熨 盏 钵 踞 垱 虚 离 约 埤 出 簿 记 敷 载 龟 夕 孰 眷 膳 努 救 珞 焕 献 鸥 丫 烂 幺 崾 脂 侏 豪 芹 帅 戚 皓 浯 仿 舀 隔 斋 倘 念 蕴 破 雒 量 禇 珀 垂 卿 钊 吼 韭 髙 炼 锷 宪 辑 孚 串 乃 猇 觅 撮 障 期 篓 迷 嵋 茴 颈 奶 璃 拍 勾 垒 诚 粟 凹 枧 配 埃 耶 俚 沼 倮 戌 帝 细 旭 椿 稳 条 澳 奥 医 是 圆 猫 造 浓 犊 证 夭 洣 峤 菇 叉 绒 雎 统 企 乙 裙 碗 置 蜂 樱 途 瑰 寓 琥 趾 虢 答 暗 乎 隅 属 但 混 费 钓 琉 扯 循 乘 碣 娥 淙 杵 棘 阔 往 指 苴 杂 菩 淯 惜 竟 欧 榜 鼻 战 屈 脱 泄 鹉 审 陬 琳 闪 萼 伙 篱 亩 仆 庭 猛 脑 漪 砥 类 脊 舂 舶 鑫 札 踏 埕 陌 调 翻 鹦 品 歪 境 页 讲 材 枷 煎 茭 础 佑 抱 矾 彩 溢 快 淹 录 钰 菱 奔 笏 蹬 蔑 般 欣 豁 姓 圃 韬 装 渊 庾 洽 秧 访 瓶 壤 贞 己 凝 煤 泃 艳 看 酿 慧 亦 汊 炭 适 澹 咡 骏 拿 沦 塍 森 颂 似 畅 奴 不 岜 盔 铧 潇 眼 悲 沪 消 薪 投 泡 酇 腐 蒜 刻 蓥 列 柑 畋 袋 迳 网 穰 竖 聪 钤 鲸 靳 茫 贯 股 拾 杰 改 漉 甫 洵 洙 锁 陟 鲇 巡 洄 糖 煌 俊 谌 杠 濞 还 垮 帕 止 练 蜚 搜 篮 垆 潦 脚 今 传 活 卅 澥 涔 娜 稗 谋 筑 派 蠡 点 搬 钹 芥 亥 沤 核 坂 朵 可 咪 药 湿 饮 茗 仔 唯 姐 抬 凼 泮 堠 硼 怡 悬 粱 停 邺 漆 素 呷 堵 涝 墓 拦 旦 备 因 注 砭 诗 桠 胥 确 漓 好 徊 切 世 葵 笆 蹄 浜 斑 避 轻 凭 座 塅 目 菉 扇 赖 浴 极 朋 靠 塚 杖 仵 顿 喂 禅 溶 堌 荞 鸠 客 鸳 篆 鲍 糯 勃 父 试 萄 彬 卞 徘 拔 硚 刁 妃 闸 涓 朴 对 奋 仕 身 攸 荄 咀 龚 邗 粮 竺 垄 轴 颛 烽 梯 弼 篢 苦 渎 哥 耆 匠 佃 蚕 囊 淞 壕 橦 葡 棍 晖 埝 涉 圻 滴 掇 黍 娃 贸 葭 嵯 存 倪 楠 塬 琯 垓 笋 湍 找 浒 潆 忙 樵 郜 斛 蔗 等 褚 睦 珙 薰 履 硐 簧 纬 接 邕 佐 绣 愁 冻 倒 扣 炎 折 泼 遮 汗 矶 移 轩 崞 堽 致 稔 霓 砦 栋 漾 表 错 岣 歧 设 匣 脉 骆 滇 涵 迪 谦 翰 陡 沉 讷 智 渌 耕 璜 盈 孤 狼 筹 形 斤 镜 汲 假 邙 渥 绩 箭 态 谈 焉 硖 俄 晁 尹 缸 寅 宇 帽 允 斌 拆 瀛 弯 嘛 溜 嵝 浈 志 磊 逍 婆 梭 阚 榄 杯 虬 际 尺 渣 敬 计 沚 忽 珲 耽 歌 锅 令 绕 培 籍 逻 鸾 送 摆 佘 垕 菜 敕 昙 赞 显 现 怒 韦 渑 片 湄 衣 芷 棉 鹊 玲 占 藻 喻 必 稍 养 枢 物 珍 涯 圣 蛇 驾 濂 臧 廓 卯 爷 塌 机 矣 郧 早 圪 秭 介 汛 珑 革 穿 称 岘 佰 荻 杞 犹 限 筒 厚 少 劝 廷 藕 伟 獏 郫 漫 驹 耒 束 研 超 实 碾 洑 蒗 丝 沱 腊 涛 棋 畜 筱 辋 畔 操 鹏 矸 衙 驮 引 母 闫 砖 芳 鸿 獐 措 且 玄 真 匀 众 淋 叭 坭 浚 榨 苇 骑 殊 镶 禺 型 芬 盆 略 泺 浣 排 俞 么 麓 笔 芗 稽 须 才 渤 浆 垟 勉 箕 刀 祠 背 侨 箬 只 代 栅 然 缀 总 歇 猴 濠 含 亨 峻 茆 由 晴 尕 轲 滚 邦 榴 纯 倴 晓 驼 弓 浉 巢 町 卜 精 崂 轮 采 沃 习 亮 杉 悦 断 旬 鄯 琴 守 耀 霄 妈 炮 席 筠 票 健 掌 乾 槎 畴 陀 傅 巫 汴 垡 足 策 妥 珊 霖 体 架 庞 严 别 漕 厝 纪 狱 插 征 晃 渚 瞿 芭 跑 纸 眙 落 柿 散 初 逊 邛 护 皂 诏 聂 槽 鳌 滋 竞 榭 末 堪 塞 骅 悟 邾 裘 宛 缙 淘 育 季 跃 阡 鹰 羽 班 仡 洒 希 验 岫 崃 使 艺 瓜 幸 舆 功 灰 柞 士 郁 岢 崆 久 转 坟 霸 书 付 淇 迦 戛 迤 聚 蒿 端 恒 翟 打 埇 索 次 偏 准 申 鄠 鹅 也 砀 党 蟠 巍 涌 垤 灯 动 茨 句 藁 荡 要 殿 旌 樊 溧 群 舟 硕 考 乔 灶 演 杆 僧 圭 盂 穗 斡 荷 符 册 午 位 邮 棵 瞻 裴 鲤 套 铅 创 坤 时 灞 诺 弋 拖 冕 佬 垌 覃 遥 更 均 融 稻 妙 夷 戈 第 协 亚 空 艾 蓼 沥 柔 卓 军 渝 迭 顾 丛 耳 凯 栏 枞 巧 植 坳 拐 墅 支 蕲 儿 琊 阆 盱 舜 屿 主 豆 若 殖 外 墙 字 谟 烈 面 叙 墟 根 未 鄄 熊 休 麒 儒 比 烦 碚 版 突 砂 尤 跳 赛 瓯 螺 疏 颜 芮 起 潢 汀 将 税 傈 淅 庵 陉 瓮 麟 溆 琅 敏 僳 播 示 夹 汨 撒 锋 立 峙 放 矿 廉 史 印 蔚 赫 丈 奈 综 赉 央 浏 劳 娘 零 让 恭 冲 项 哨 涂 复 有 展 桓 涡 沐 结 佤 学 旅 微 栾 童 番 畈 迈 峄 醴 颇 荥 殷 澜 罕 荫 猗 稷 乳 郝 芙 藤 故 彰 伯 牌 谯 段 嵊 者 屋 邻 鄱 耿 酒 辰 晏 教 梦 弄 蔺 峒 箐 厦 沾 昔 增 郏 綦 火 磁 棣 查 勤 阎 狮 禄 得 蓉 崔 归 种 恰 穴 飞 奎 栗 拱 酉 腰 默 伏 董 钢 浑 棚 芒 雍 半 浔 渔 嵩 圈 敖 从 璧 曾 涪 孔 生 坨 姑 交 潘 防 泌 仲 雪 冢 椒 杏 湟 绿 朐 堆 谢 斗 棠 蒋 寻 监 喜 庐 茌 基 尉 君 棱 偃 息 先 拜 柱 宗 互 本 兖 沭 祖 随 莘 浠 桦 蜀 隘 谭 枫 单 牙 舍 蛟 翁 积 榕 礼 女 厢 航 祜 年 肖 昂 助 碧 垦 振 犍 腾 豫 暨 月 获 易 炉 简 升 奇 冠 闻 额 千 萧 弥 宅 迎 独 吐 嫩 启 穆 樟 闽 程 洮 潞 岐 滑 虹 电 壶 朗 响 秋 坦 岙 尚 荔 苑 戴 联 莎 宏 附 间 馆 垭 共 为 蕉 坞 曼 垛 崖 泾 攀 睢 巩 鼎 鸣 澧 越 濉 澄 盖 法 鄢 历 宕 寒 分 冷 闵 忠 皋 雨 埔 疃 幢 宽 岸 翠 蓟 沛 两 畲 如 卧 敦 郎 涞 槐 坑 司 解 钱 翔 禾 围 船 邓 萍 步 琼 岑 梨 包 潜 熟 莞 觉 潼 喇 淀 皮 坛 何 渠 圳 淖 岱 沽 相 薛 坻 儋 凌 沅 舒 舞 冀 袁 柘 旧 向 始 坎 局 氏 鸭 滕 郯 油 涟 勐 韶 磐 冯 嘎 当 磨 繁 贾 燕 茶 祝 芝 剑 涿 莫 蒲 汶 卡 魏 提 莆 部 雁 雷 碶 栖 召 诸 牧 虞 力 泥 甲 其 葫 茅 祁 淳 静 贺 莒 掖 楞 嘴 即 码 所 织 尾 牟 干 窝 婺 修 应 邳 杜 果 岚 盛 润 首 漯 裕 滦 爱 服 郓 冶 厂 热 丁 巨 壁 犁 美 侯 叶 任 奉 纳 师 柴 于 宋 堤 驿 尖 辉 碑 鼓 鞍 玛 邱 峨 枝 浪 尧 角 强 汕 招 至 毛 贤 浮 阁 卢 院 霍 观 垣 涧 居 岔 思 各 野 范 鱼 葛 桐 人 进 容 株 蓝 陂 益 凰 洱 柯 蚌 游 象 米 慈 亳 环 汇 禹 户 梓 钦 泊 旺 麦 仓 汤 衢 滁 务 加 佳 度 胡 胶 沿 陆 梧 扶 草 则 卫 仪 宫 霞 钟 眉 善 墨 射 墩 心 贝 彦 傣 扬 员 托 揭 虎 神 全 国 兵 洼 肇 朱 权 登 圩 郊 板 巷 良 汝 羌 泗 深 风 浩 色 那 灌 仑 羊 珠 姚 牡 芜 扎 湛 汪 秀 站 堂 瑞 峡 楚 后 潮 产 鲜 黎 香 无 峪 多 桑 库 萨 孙 陶 屏 昆 室 泸 紫 窑 韩 音 工 孟 承 颍 麻 正 姜 雅 留 焦 作 堰 景 芦 望 绍 房 柏 胜 甸 瓦 苍 管 蓬 府 施 流 界 星 莲 蔡 光 银 鹿 邹 彭 贡 照 七 鹤 封 荣 郴 章 英 察 盘 余 百 右 盟 茂 科 牛 雄 曙 老 灵 赵 娄 肥 顶 图 佛 鄂 迁 朔 渭 渡 密 翼 丽 底 驻 边 名 瑶 车 洞 感 滩 皇 运 横 锡 昭 抚 鲁 曹 伦 公 遵 节 竹 洋 崇 廊 来 伊 漳 恩 鸡 绥 汾 绵 宣 寿 锦 祥 尼 埠 富 潭 吕 湘 濮 辛 桃 沈 呼 阴 方 一 赤 毕 格 谷 遂 坡 寺 许 资 咸 队 同 沁 什 宾 八 秦 淄 襄 枣 官 陇 吴 杭 忻 普 树 仙 斯 岩 孜 井 勒 李 术 桂  荆 堡 下 技 宿 梅 饶 固 徐 特 理 亭 利 元 前 郭  惠 业 二 铺 农 依 陈 社 冈 聊 喀 邑 铜 万 满 十 团 日 划 靖 铁 洲 延 侗 级 齐 园 朝 远 赣 邯 左 丹 池 邵 凉 直 屯 怀 郸 湾 孝 康 郑 充 盐 柳 邢 淮 信 顺 合 岗 拉 菏 六 松 政 仁 梁 浦 黔 布 经 沧 杨 庙 洪 潍 威 嘉 刘 乌 榆 周 凤 常 隆 莱 坝 罗 岳 晋 烟 九 重)

  def names
      money = Faker.decimal(6, 2)
      cn_date_year = Faker.cn_date_year
      month_num = Faker.between(1, 12)

      cn_date_month = Money.new.cb(month_num).delete("元整")

      cn_date_month = Faker.month_num_fix(cn_date_month)
      day = Faker.between(1, 31)
      cn_date_day = Money.new.cb(day).delete("元整")

      cn_date_day = Faker.cn_date_day_fix(cn_date_day) #Money.new.cb(day).delete("元整")


      company = Faker.company
      # card_number_1 = Faker.card_number_1
      number_1 = Faker.between(1111111111111111111, 9999999999999999999)
      number_2 = Faker.between(111111, 999999)

      card_number_1= number_1.to_s+"-"+number_2.to_s
      bank = Faker.bank
      xingming = Faker.name
      card_number_2 = Faker.card_number_2
      bank_branch = Faker.bank_branch
      cn_money = Money.new.cb(money.to_i)
      en_money = money.to_s
      cn_date ="#{cn_date_year}年#{cn_date_month}月#{cn_date_day}日"
      protocol_number = Faker.protocol_number
      bank_number = Faker.bank_number
      address = Faker.address
      xingming_2 = Faker.name
      en_date_year = Faker.en_date_year
      en_date_month = Faker.en_date_month
      en_date_day = Faker.en_date_day
      phone = Ocr.new.phone
      usage = %w(划款 捐助 组委会赞助优秀工作活动基金 兑奖 备用金 差旅费 工资 劳务费 奖金 货款 农副产品收购 津贴).sample

      id_value = System.cache_id("name_id")

      data = {
        id: id_value,
        cn_date_year:cn_date_year,
        cn_date_month:cn_date_month,
        cn_date_day:cn_date_day,
        company:company,
        card_number_1:card_number_1,
        bank:bank,
        xingming:xingming,
        card_number_2:card_number_2,
        bank_branch:bank_branch,
        cn_money:cn_money,
        en_money:en_money,
        cn_date:cn_date,
        protocol_number:protocol_number,
        bank_number:bank_number,
        address:address,
        xingming_2:xingming_2,
        en_date_year:en_date_year,
        en_date_month:en_date_month,
        en_date_day:en_date_day,
        phone:phone,
        created_at: Time.now,
        updated_at: Time.now,
        usage: usage
      }

      render :json =>  {
        data: data,
        err_no: 0,
        msg: "success"
      }, :status => 200
  end

  def name
      xingming = Faker.name

      render :json =>  {
        data: xingming,
        pinyin: Pinyin.t(xingming),
        err_no: 0,
        msg: "success"
      }, :status => 200
  end

  def phone
      data =  Ocr.new.phone

      render :json =>  {
        data: "#{data}",
        err_no: 0,
        msg: "success"
      }, :status => 200
  end


  def show
      @hz_bank = Hz::Bank.find(params[:id])

      render :json =>  {
        data:@hz_bank,
        err_no: 0,
        msg: "success"
      }, :status => 200
  end

  def address

    code = ALL_CODE.sample
    village = Core::Village.get_shourt_full_name(code)[2]

      render :json =>  {
        data: "#{Time.now.to_i}_#{village}",
        err_no: 0,
        msg: "success"
      }, :status => 200
  end

  def name_ids
      @hz_bank = Hz::Bank.where(id: params[:ids].split(','))
      render :json =>  {
        data:@hz_bank,
        err_no: 0,
        msg: "success"
      }, :status => 200
    end

    def idcards
      name = Faker.name
      sex = ["男", "女"].sample
      # nation = ""
      nation  = Faker.minzhu
      birthday_date = Faker.birthdays(10,75)
      birthday = birthday_date.strftime("%Y%m%d")

      code = ALL_CODE.sample
      village = Core::Village.get_shourt_full_name(code)

      street = village[2].strip
      org = village[0].strip
      org_code = village[1].strip
      number = Faker.gen_id_card(org_code, birthday).strip

      n = Faker.between(6, 40)
      start_at =(birthday_date+n.year)
      end_at = (start_at+[10, 20, 30, 40].sample.year)

      id_value = System.cache_id("ocr_idcards_id")

      data = {
        id: id_value,
        name: name,
        sex: sex,
        nation: nation,
        birthday: birthday_date.strftime("%Y-%m-%d"),
        street: street,
        number: number,
        org: org,
        start_at: start_at.strftime("%Y.%m.%d"),
        end_at: end_at.strftime("%Y.%m.%d")
      }
      render :json =>  {
        data: data,
        err_no: 0,
        msg: "success"
      }, :status => 200
  end


    def fuck_idcards
      name = Faker.name
      sex = ["男", "女"].sample
      # nation = ""
      nation  = Faker.minzhu
      birthday_date = Faker.birthdays(10,75)
      birthday = birthday_date.strftime("%Y%m%d")

      code = ALL_CODE.sample
      village = Core::Village.get_shourt_full_name(code)

      street = HZZZZ.sample(15).join("")
      org = village[0].strip
      org_code = village[1].strip
      number = Faker.gen_id_card(org_code, birthday).strip

      n = Faker.between(6, 40)
      start_at =(birthday_date+n.year)
      end_at = (start_at+[10, 20, 30, 40].sample.year)

      id_value = System.cache_id("ocr_idcards_id")

      data = {
        id: id_value,
        name: name,
        sex: sex,
        nation: nation,
        birthday: birthday_date.strftime("%Y-%m-%d"),
        street: street,
        number: number,
        org: org,
        start_at: start_at.strftime("%Y.%m.%d"),
        end_at: end_at.strftime("%Y.%m.%d")
      }
      render :json =>  {
        data: data,
        err_no: 0,
        msg: "success"
      }, :status => 200
  end

  def xingshizheng
    name2 = Faker.name
    name1 = Faker.company

    # nation = ""
    nation  = Faker.minzhu
    birthday_date = Faker.birthdays(10,75)
    birthday = birthday_date.strftime("%Y%m%d")

    code = ALL_CODE.sample
    village = Core::Village.get_shourt_full_name(code)

    n = Faker.between(-10, 30)
    start_at =(birthday_date+n.year)
    end_at = (start_at+[0, 3, 6, 10, 20].sample.year)
    #=============

    palte_no = Faker.plate_no #"豫Q7F555"
    vehicle_type = Faker.vehicle_type#"小型轿车"
    owner = [name2, name1].sample
    address_str =  village[2].strip
    address_1 = address_str+"-#{Faker.between(1,99)}"
    address_2 = address_str+"-#{Faker.between(1,9)}-#{Faker.between(1,99)}"
    address_4 = address_str.split("村")[0] +"-#{Faker.between(1,99)}" + "（"+ address_str.split("村")[1] +"）" if address_str.include?("村")

    address_4 = address_str.split("镇")[0] +"-#{Faker.between(1,99)}" + "（"+ address_str.split("镇")[1] +"）"  if address_str.include?("镇")

    address_3 = address_str.split("村")[0] +"（"+ address_str.split("村")[1] +"）" if address_str.include?("村")
    address_3 = address_str.split("镇")[0] +"（"+ address_str.split("镇")[1] +"）"  if address_str.include?("镇")
    address = [address_1, address_2, address_3, address_4].sample
    address= address.nil?? address_str:address.sub("（）", "")
    use_nature = Faker.use_nature
    model =  Faker.car_model #"大众牌CA0292AT"
    vin =  Faker::PLATE_CHARS.sample(17).join("") #"LSGPB54R4DD331665"
    engine_no =Faker.number(8)# "80101867"
    register_date = start_at
    issue_date = end_at
    #=============


    street = village[2]
    org = village[0]
    org_code = village[1]
    number = Faker.gen_id_card(org_code, birthday)

    id_value = System.cache_id("ocr_idcards_id").to_i

    data = {
      id: id_value,
      palte_no:palte_no ,
      vehicle_type:vehicle_type ,
      owner:owner ,
      address:address ,
      use_nature:use_nature ,
      model:model ,
      vin:vin ,
      engine_no:engine_no ,
      register_date:register_date.strftime("%Y-%m-%d") ,
      issue_date:issue_date.strftime("%Y-%m-%d") ,

      # name: name,
      # sex: sex,
      # nation: nation,
      # birthday: birthday_date.strftime("%Y-%m-%d"),
      # street: street.strip,
      # number: number,
      # org: org,
      # start_at: start_at.strftime("%Y.%m.%d"),
      # end_at: end_at.strftime("%Y.%m.%d")
    }
    render :json =>  {
      data: data,
      err_no: 0,
      msg: "success"
    }, :status => 200
  end

  def idcard
      @hz_idcard = Hz::Idcard.find(params[:id])
      render :json =>  {
        data:@hz_idcard,
        err_no: 0,
        msg: "success"
      }, :status => 200
  end


  # 驾驶证接口
  def driving_license
    name = Faker.name
    sex = ["男", "女"].sample
    nation  = "中国"
    birthday_date = Faker.birthdays(18,50)
    birthday = birthday_date.strftime("%Y%m%d")

    id_value = System.cache_id("driving_license_id", 22241)

    code = ALL_CODE.sample
    village = Core::Village.get_shourt_full_name(code)
    street = village[2]
    org = village[0]
    org_code = village[1]
    number = Faker.gen_id_card(org_code, birthday).strip
    n = Faker.between(0, 30)
    class_car = %w(A1 A2 A3 B1 B2 C1 C2 C3 C4 D E F M N P).sample
    start_at =(birthday_date+n.year)
    valid_year = [6, 10].sample
    end_at = (start_at+valid_year.year)

    render :json =>  {
      data: {
        id:id_value.to_i,
        number: number,
        name: name,
        sex: sex,
        year: valid_year,
        nation: nation,
        street: street.strip,
        birthday: birthday_date.strftime("%Y-%m-%d"),
        first_data: start_at.strftime("%Y-%m-%d"),
        class_car: class_car,
        start_at: start_at.strftime("%Y-%m-%d"),
        end_at: end_at.strftime("%Y-%m-%d")
      },
      err_no: 0,
      msg: "success"
    }, :status => 200
  end

  # match "api/small_letter" => "ocr#small_letter", via: [:get]
  # match "api/date_data" => "ocr#date_data", via: [:get]

  # 千位分割数字
  def small_letter
    zhengshu = Faker.between(1000,99999999)
    xiaoshu = Faker.between(11,99)
    a = Faker.between(1,2)
    # number = (a == 1 ? "#{zhengshu}.#{xiaoshu}":"#{zhengshu}")
    number =  "#{zhengshu}.#{xiaoshu}"
    data = Faker.part_number(number)

    render :json =>  {
      data: {
        id: "#{Time.now.to_i.to_s[5..-1]}#{Faker.number(2)}",
        data: "(#{data})",
        number: number,
      },
      err_no: 0,
      msg: "success"
    }, :status => 200
  end

  def date_data

  # 2.1 XXXX.X.X，如2016.5.6
  # 2.2 XXXX-X-X，如2016-6-7
  # 2.3 XXXX年X月X日，如2016年6月7日
  # 2.4 XXXX年度，如2016年度
  # 2.5 XXXX年上半年，如2016年上半年
  # 2.6 XXXX年下半年，如2016年下半年

    str = %w(("%Y.%m.%d") ("%Y-%m-%d") ("%Y年%m月%d日") ("%Y年度") ("%Y年上半年") ("%Y年下半年")).sample
    date = Faker.birthdays(-1,20)
    # @hz_idcard = Hz::Idcard.find(params[:id])
    data = eval("date.strftime#{str}")
    render :json =>  {

      data: {
        id: "#{Time.now.to_i.to_s[5..-1]}#{Faker.number(2)}",
        data: data,
      },
      err_no: 0,
      msg: "success"
    }, :status => 200
  end





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
  def hegezheng
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


    id_value = System.cache_id("ocr_dj_yizhixing_id")
    #c0 = "#{Faker.char_num(6)}#{Faker.char_num(3)}#{Faker.number(6)}"
    #c1 = "#{Faker.char_num(6)}#{Faker.char_num(4)}#{Faker.number(6)}"
    c2 = "#{Faker.char_num(6)}#{Faker.char_num(5)}#{Faker.number(6)}"
    #c3 = "#{Faker.char_num(6)}#{Faker.char_num(2)}#{Faker.number(6)}"
    发动机号码 =  Faker.char_num(9) #YC6105ZLQ
    车辆识别代号 = c2 #[c0, c1, c2, c3].sample
    车辆颜色 =  %w(白色 灰色 黄色 粉色 红色 紫色 绿色 蓝色 棕色 黑色 其他).sample

    data = {
      id: id_value,
      daihao: 车辆识别代号,
      fasongji: 发动机号码,
      yanse: 车辆颜色,
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
