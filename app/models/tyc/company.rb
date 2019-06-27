class Tyc::Company < ApplicationRecord
    scope :used, -> { where(used:1)}
    scope :unused, -> { where(used:0)}
    belongs_to :category, class_name: "Tyc::Category", foreign_key: :category_id

  def base_info
    {
      id: id,
      reg_number: get_reg_number,
      name: name,
      category_id: category.name,
      address: get_address,
      boss_name: get_boss_name,
      reg_money: get_reg_money,
      set_date: for_time(get_set_date),
      end_time: for_time(get_end_time),
      operate_scope: get_operate_scope,
      organ: organ,
      allow_time: get_allow_time,
    }
  end

    # 成立日期
    def get_set_date

        p end_time
        if end_time.size > 9
            p end_time
            date =  Date.parse(end_time[0..9])
            Faker.max_date(date)
        else
            Faker.max_date
        end

    end

    # dizhi
    def get_address
        p address
        if address.size > 40
            address.split('...')[0]
        elsif address.size < 3
            Faker.real_address
        else
            address
        end
    end

    # 经营范围
    def get_operate_scope
        p operate_scope
        if operate_scope.size > 2
            operate_scope
        else
            Faker.gen_scope
        end
    end

    # 法人姓名
    def get_boss_name
        p boss_name
        if boss_name.size > 1
            boss_name
        else
            Faker.name
        end
    end

    # 注册资金
    def get_reg_money
        p reg_money
        if reg_money.size > 2
            reg_money
        else
            Faker.number(4) + "万人民币"
        end
    end

    # 经营期限
    def get_end_time
        p end_time
        if end_time.size > 5
            end_time
        else
            Faker.max_date + "至无固定期限"
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

        p end_time
        if end_time.size > 9
            p end_time
            date =  Date.parse(end_time[0..9])
            Faker.max_date(date, -3)
        else
            Faker.max_date
        end

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
