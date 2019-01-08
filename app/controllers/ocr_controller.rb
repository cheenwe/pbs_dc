class OcrController < ActionController::API

  def name
      money = Faker.between(10000, 9999999)

      cn_date_year = Faker.cn_date_year
      cn_date_month = Faker.cn_date_month
      cn_date_day = Faker.cn_date_day
      company = Faker.company
      card_number_1 = Faker.card_number_1
      bank = Faker.bank
      xingming = Faker.name
      card_number_2 = Faker.card_number_2
      bank_branch = Faker.bank_branch
      cn_money = Money.new.cb(money)
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

      data = Hz::Bank.create(
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
        phone:phone
        )

      render :json =>  {
        data: data,
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

  def name_ids

      @hz_bank = Hz::Bank.where(id: params[:ids].split(','))

      render :json =>  {
        data:@hz_bank,
        err_no: 0,
        msg: "success"
      }, :status => 200
  end
  
    



end
