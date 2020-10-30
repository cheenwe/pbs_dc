class TycController < ActionController::API

  before_action :set_hz_bank, only: [:new]

  #接收python爬虫的数据
  def new
    code = params[:code].split('/').last
    tyc_company = Tyc::Company.find_by_code(code)
    if tyc_company.present?
      render :json =>  {
        err_no: 1,
        data: '',
        status: {
          code: 500,
          msg: "数据存在"
        },
      }, :status => 200
    else
      #p @tyc_company_params
      @tyc_company = Tyc::Company.new(@tyc_company_params)
      if @tyc_company.save!
        render :json =>  {
          data: @tyc_company,
          status: {
            code: 200,
            msg: "保存成功"
          },
          err_no: 0,
        }, :status => 200
      else
        render :json =>  {
          err_no: 1,
          data: '',
          status: {
            code: 500,
            msg: "保存失败"
          },
        }, :status => 200
      end
    end
  end

  #给调用爬取的公司信息
  #  api/company
  def company
    tyc_company = Tyc::Company.unused.sample(1)[0]

    if tyc_company.present? && tyc_company.update(used:1)
      render :json =>  {
        err_no: 0,
        data: tyc_company.base_info,
        status: {
          code: 200,
          msg: "数据存在"
        },
      }, :status => 200
    else
      render :json =>  {
        err_no: 1,
        data: '',
        status: {
          code: 500,
          msg: "数据不存在"
        },
      }, :status => 200
    end
  end


  #给调用爬取的公司信息
  #  api/company
  def company1
    tyc_company = Cn::Company.first(200).sample

    if tyc_company.present? && tyc_company.update(used:1)
      render :json =>  {
        err_no: 0,
        data: tyc_company.base_info,
        status: {
          code: 200,
          msg: "数据存在"
        },
      }, :status => 200
    else
      render :json =>  {
        err_no: 1,
        data: '',
        status: {
          code: 500,
          msg: "数据不存在"
        },
      }, :status => 200
    end
  end

  # 接收爬取cid信息
  def cid
      city_id = Tyc::City.create_or_find_by_name(params[:city])

      data = []
      params[:cids].split(',').each do |item|
        if item != ''
          data << Tyc::Cid.new(
            city_id: city_id,
            state:0,
            number: item
          )
        end
      end
      Tyc::Cid.import data
      # cid = params[:cid]

      # Tyc::Cid.create(
      #       city_id: city_id,
      #       state:0,
      #       number: cid
      #     )

      current_cid_url = params[:url]
      Rails.cache.write("current_cid_url", current_cid_url)

      render :json =>  {
        err_no: 0,
        data: "tyc_company.base_info",
        status: {
          code: 200,
          msg: "success"
        },
      }, :status => 200
  end

  def request_cid
    data = Tyc::Cid.unused.first

    data.update(state:1)

    render :json =>  {
      err_no: 0,
      data: data.number,
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end

  def need_verify
    app = params[:app]
    time = params[:time]
    url = params[:url]

    value = app + ","+time + ","+url
    key = "#{app}_need_verify"

    # $redis.set(key, value)
    System.cached(key, value)

    # key = "1551058718-search_cid"
    # $redis.get(key)

    render :json =>  {
      err_no: 0,
      data: "data.number",
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end

  def check_verify_ok
    app = params[:app]

    key = "#{app}-ok"

    # check_verify_ok = $redis.get(key) || 0
    check_verify_ok = System.cached(key) || 0
    # check_verify_ok = "1"#System.cached(key) || 0

    if check_verify_ok == "1"
      ok_str = 1
      # $redis.set(key, "")
      System.cached(key, "")
    else
      ok_str = 0
    end

    # key = "1551058718-search_cid"
    # $redis.get(key)

    render :json =>  {
      err_no: 0,
      data: check_verify_ok,
      ok: ok_str,
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end

  def cookie
    app = params[:app] rescue  0
    key = "#{app}-cookie"

    # @tyc_cookie = $redis.get(key)
    cookie = System.cached(key)
    render :json =>  {
      err_no: 0,
      data: cookie,
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hz_bank

      industry_id = Tyc::Industry.create_or_find_by_name(params[:industry_id])
      category_id = Tyc::Category.create_or_find_by_name(params[:category_id])
      city_id = Tyc::City.create_or_find_by_name(params[:city])

      @tyc_company_params = {
        city_id: city_id,
        code: params[:code].split('/').last,
        logo: params[:logo],
        name: params[:name],
        old_name: params[:old_name],
        phone: params[:phone],
        mail: params[:mail],
        url: params[:url],
        address: params[:address],
        intro: params[:intro],
        update_date: params[:update_date],
        boss_name: params[:boss_name],
        reg_money: params[:reg_money],
        set_date: params[:set_date],
        status: params[:status],
        reg_number: params[:reg_number],
        credit_code: params[:credit_code],
        company_code: params[:company_code],
        tax_code: params[:tax_code],
        category_id: category_id ,
        end_time: params[:end_time],
        industry_id:industry_id,
        tax: params[:tax],
        allow_time: params[:allow_time],
        pay_money: params[:pay_money],
        all_people: params[:all_people],
        insured_people: params[:insured_people],
        organ: params[:organ],
        reg_address: params[:reg_address],
        en_name: params[:en_name],
        operate_scope: params[:operate_scope],
      }
    end


end
