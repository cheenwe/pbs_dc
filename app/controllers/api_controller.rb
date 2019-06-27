class ApiController < ActionController::API

  def dc_user
    uid = params[:uid]
    photo_num = params[:photo_num]
    photo_hash = params[:photo_hash]
    sign = params[:sign]

    # @user = Dc::User.new(
    #   uid: params[:uid],
    #   photo_num: params[:photo_num],
    #   photo_hash: params[:photo_hash],
    #   sign: params[:sign],
    # )


    if UserJob.perform_later(uid, photo_num, photo_hash, sign)
      render :json =>  {
        data: uid,
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

  def dc_user_photos

    uid = params[:uid]
    photo_num = params[:photo_num]
    photo_hash = params[:photo_hash]
    sign = params[:sign]
    photos = params[:photos]
    base_info = params[:base_info]

    # @user = Dc::User.new(
    #   uid: params[:uid],
    #   photo_num: params[:photo_num],
    #   photo_hash: params[:photo_hash],
    #   sign: params[:sign],
    # )

    if UserPhotoJob.perform_later(uid, photo_num, photo_hash, sign,base_info,  photos)
      render :json =>  {
        data: uid,
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

  def check_info
    @dc_user = Dc::User.where(info:nil).last
    @dc_user.update(has_photo:true) rescue ''

    if @dc_user.present? #UserJob.perform_later(uid, photo_num, photo_hash, sign)
      render :json =>  {
        data: @dc_user.base_info,
        status: {
          code: 200,
          msg: "成功"
        },
        err_no: 0,
      }, :status => 200
    else
      render :json =>  {
        err_no: 1,
        data: @dc_user.base_info,
        status: {
          code: 500,
          msg: "保存失败"
        },
      }, :status => 200
    end
  end


  # 分配uid
  # need 需要多少id 1000 , 2000 
  # remark 那个爬虫信息 xxxx
  def uid
    @uid = Uid.last
    if @uid.present?  
      current_num = @uid.number
      add_size = params[:need].to_f || 1000
      number = current_num + add_size

      @new_uid = Uid.create(
        number: number,
        remark: params[:remark],
      )
      render :json =>  {
        data: [current_num,  @new_uid.number],
        status: {
          code: 200,
          msg: "成功"
        },
        err_no: 0,
      }, :status => 200
    else
      render :json =>  {
        err_no: 1,
        data: @uid,
        status: {
          code: 500,
          msg: "保存失败"
        },
      }, :status => 200
    end
  end

  #def monitor
  #p params[:id]
  #p params[:data]
  #end
  # 监控服务器温度信息
  #  ip 服务器 ip
  #  data 数据信息
  def monitor
    @server = Monitor::Server.find_by(ip: params[:ip])
    if @server.present?
      server_id = @server.id
    else
      @server = Monitor::Server.create(ip: params[:ip])
    end

    server_id = @server.id 

    @info = Monitor::Info.create(
      server_id: server_id,
      remark: params[:data],
    )
    
    render :json =>  {
      status: {
        code: 200,
        msg: "成功"
      },
      err_no: 0,
    }, :status => 200
  
  end 
end
