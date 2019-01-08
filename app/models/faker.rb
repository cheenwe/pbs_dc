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
    ADD_PREFIX = Faker::DATA["address"]["city_prefix"]
    ADD_SUFFIX = Faker::DATA["address"]["city_suffix"]


    class << self
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

      # ============================================
      #en_date
      def en_date_year
        return birthday(3, 95).split("-")[0]
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
        s1 = "1#{PHONE_SIGN.sample(1)[0]}#{gen_num}_#{gen_num}#{gen_num}_#{gen_num}#{gen_one_num(1)}"
        return   s1
      end


      # ============================================
      # date

      def date(m=0)
        from = ::Date.today + 1
        to   = ::Date.today + m.year
        between(from, to).strftime("%Y-%m-%d")
      end

      def birthday(min_age = 1, max_age = 3)
        t = ::Date.today

        from = birthday_date(t, max_age)
        to   = birthday_date(t, min_age)

        between(from, to).strftime("%Y-%m-%d")
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
    end

end
