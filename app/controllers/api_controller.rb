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
        err_no: 0,
        data: "1",
        status: {
          code: 200,
          msg: "保存成功"
        },
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
