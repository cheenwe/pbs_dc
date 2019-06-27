class Cn::Company < ApplicationRecord
	def self.total_entries
		5888641
	end


    scope :used, -> { where(used:1)}
	scope :unused, -> { where(used:0)}
	

	def base_info
		{
		  id: "9000#{id}",
		  name: name,
		  reg_number: code,
		  category_id: get_c_type,
		  address: get_address,
		  boss_name: get_boss_name,
		  reg_money: get_reg_money,
		  set_date: for_time(get_set_date),
		  end_time: (get_end_time),
		  operate_scope: get_operate_scope,
		  organ: "#{city}工商行政管理局",
		  allow_time: get_allow_time,
		}
	  end

	  def get_c_type
		if c_type == "N/A"
			["社会工作", "专业技术服务业", "批发业", "资本市场服务", "电信、广播电视和卫星传输服务", "土木工程建筑业", "道路运输业", "商务服务业", "零售业", "货币金融服务", "房屋建筑业", "-", "燃气生产和供应业", "石油加工、炼焦和核燃料加工业", "专用设备制造业", "电力、热力生产和供应业", "水上运输业", "科技推广和应用服务业", "纺织服装、服饰业", "通用设备制造业", "软件和信息技术服务业", "其他金融业", "农业", "研究和试验发展", "房地产业", "铁路、船舶、航空航天和其他运输设备制造业", "邮政业", "煤炭开采和洗选业", "餐饮业", "教育", "公共设施管理业", "汽车制造业", "化学原料和化学制品制造业", "仓储业", "租赁业", "装卸搬运和运输代理业", "建筑装饰和其他建筑业", "农副食品加工业", "保险业", "非金属矿物制品业", "广播、电视、电影和影视录音制作业", "医药制造业", "住宿业", "社会保障", "仪器仪表制造业", "皮革、毛皮、羽毛及其制品和制鞋业", "生态保护和环境治理业", "电气机械和器材制造业", "互联网和相关服务", "航空运输业", "黑色金属冶炼和压延加工业", "农、林、牧、渔服务业", "计算机、通信和其他电子设备制造业", "建筑安装业", "纺织业", "酒、饮料和精制茶制造业", "居民服务业", "印刷和记录媒介复制业", "畜牧业", "木材加工和木、竹、藤、棕、草制品业", "食品制造业", "金属制品业", "其他服务业", "造纸和纸制品业", "机动车、电子产品和日用产品修理业", "林业", "有色金属矿采选业", "新闻和出版业", "有色金属冶炼和压延加工业", "水的生产和供应业", "化学纤维制造业", "家具制造业", "其他制造业", "文教、工美、体育和娱乐用品制造业", "体育", "废弃资源综合利用业", "卫生", "橡胶和塑料制品业", "渔业", "金属制品、机械和设备修理业", "铁路运输业", "烟草制品业", "开采辅助活动", "非金属矿采选业", "水利管理业", "文化艺术业", "娱乐业", "其他采矿业", "石油和天然气开采业", "黑色金属矿采选业", "管道运输业"].sample
			# %w(技术, 科技, 电子科技, 电子科技有限公司, 电子科技股份有限公司, 科技股份, 科技股份有限公司, 股份有限公司, 有限责任公司, 有限公司, 股份公司, 公司, 集团, 制药, 药业, 信息服务, 发展有限公司, 发展有限责任公司, 发展股份有限公司, 投资控股, 国际控股, 产业控股, 旅游中心, 实业投资, 产业投资, 科技实业, 科技产业, 网络技术, 电子信息产业, 文化娱乐传媒, 传媒, 娱乐传媒, 信息技术, 信息技术有限公司, 信息技术责任有限公司, 矿业).sample
		else
			c_type
		end
	  end 
	
		# 成立日期
		def get_set_date
			regdate
		end
	
		# dizhi
		def get_address
			p address
			if address.size > 40
				address.split('...')[0]
			elsif address.size < 3
				Faker.real_address
			else
				address.delete('"')
			end
		end
	
		# 经营范围
		def get_operate_scope
			business_scope.delete('"')
		end
	
		# 法人姓名
		def get_boss_name


			if boss == "N/A"
				Faker.name
			else
				boss
			end
				
		end
	
		# 注册资金
		def get_reg_money
			p capital
			if capital.include?("万")
				capital.delete('"').delete("(").delete(")")
			else
				Faker.number(4) + "万人民币"
			end
		end
	
		# 经营期限
		def get_end_time 

			end_sample =  [10, 20, 30, "至无固定期限"].sample

			date =  Date.parse(regdate)

			if end_sample != "至无固定期限"
				end_at = (date + end_sample.year).strftime("%Y-%m-%d")

				res = "#{for_time(regdate)}至#{end_at.split("-")[0]+"年"+end_at.split("-")[1]+"月"+end_at.split("-")[2]+"日"}"
				res

			else
				end_str =  "#{for_time(regdate)}至无固定期限"
			end
			

		end
	
		# 注册号
		def get_reg_number 
			if 	credit_code.size > 8
				credit_code
			else
				Faker.number(12)
			end
		end
	
		# 核准日期
		def get_allow_time

			date =  Date.parse(regdate)
			Faker.max_date(date, -3)
	
		end
	
		def format_time(datas)
			time = datas.split("-")[0]+"年"+datas.split("-")[1]+"月"+datas.split("-")[2]+"日"
			return time
		end
	
		def for_time(date)
			if date.include?("至")
				date_1 = date.split("至")[0]
				date_2 = date.split("至")[1] rescue ''
	
				str_1 = format_time(date_1)
				
				str_2 = format_time(date_2) rescue '无固定期限'
	
				"#{str_1}至#{str_2}"
			else
				format_time(date)
			end
	 
			# a = date.split("-")[0]+"年"+date.split("-")[1]+"月"+date.split("-")[2]+"日"
			# if date.include?("至")
			#     b = date.split("至")[0]
			#     c = b.split("-")[0]+"年"+b.split("-")[1]+"月"+b.split("-")[2]+"日"
				
			#     if date.split("至")[1].include?("-")
			#         d = 
			#     else
			#     end
			# end
		end
end
