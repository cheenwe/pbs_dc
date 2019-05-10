class TuhuController < ActionController::API
 
    def brand
        @brand = Tuhu::Brand.find_by(name: params[:name])
        if @brand.present?
            
        else
            @brand = Tuhu::Brand.create(
                name: params[:name],
                logo: params[:logo],
                abbr: params[:abbr],
            )
        end

        @versions = Tuhu::Version.where(
            brand_id: @brand.id, 
            name: params[:version]
        )

        if @versions.present?
            @version =  @versions.first

        else
            @version = Tuhu::Version.create(
                brand_id: @brand.id,
                name: params[:version],
            )
        end
        params[:url].split(",").each do |url|

            @details = Tuhu::Detail.where(
                version_id: @version.id, 
                url: url
            )

            if @detail.present?
                @detail  =  @details.first
            else
                @detail = Tuhu::Detail.create(
                    version_id: @version.id, 
                    url: url
                )
            end
        end

        render :json =>  {
          data: @detail,
          status: {
            code: 200,
            msg: "保存成功"
          },
          err_no: 0,
        }, :status => 200

    end


  def request_cid
    data = Tuhu::Detail.unused.sample

    data.update(state:1)

    render :json =>  {
      err_no: 0,
      data: {
        id: data.id,
        url: data.url,
      },
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end


  def cid
    # Tuhu::ProductDetail

    kind_id = check_kind[:"#{params[:kind]}"]
    detail_id = params[:id] 


    @products = Tuhu::Product.where(
        kind_id: kind_id, 
        name: params[:name]
    )

    if @products.present?
        @product =  @products.first

    else
        @product = Tuhu::Product.create(
            kind_id: kind_id, 
            img: params[:img],
            name: params[:name],
            price: params[:price],
            category: params[:category],
            url: params[:url],
        )
    end

    Tuhu::ProductDetail.create(
        detail_id: detail_id, 
        product_id: @product.id, 
    )

    render :json =>  {
      err_no: 0, 
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200

  end


  def check_kind
    {
        "火花塞": 1, 
        "空调滤清器": 2, 
        "机油滤清器": 3, 
        "空气滤清器": 4, 
        "燃油滤清器": 5
    }
end
end
