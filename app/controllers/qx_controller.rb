class QxController < ActionController::API

  def weather
    # airport_id =  Qx::Airport.where(airport_4_code: params[:airport_4_code]).last.id rescue ''
    airport_id= Qx::Airport.get_airport_id(params[:airport_4_code])

    data = {
        airport_id: airport_id,
        hour_tag: params[:hour_tag],
        value: params[:value],
        content: params[:content],
        state: params[:state],
    }

    # @tyc_cookie = $redis.get(key)
    weather = Qx::Weather.create(data)
    render :json =>  {
      err_no: 0,
      data: weather,
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end


  def runway
    # airport_id =  Qx::Airport.where(airport_4_code: params[:airport_4_code]).last.id rescue ''
    airport_id= Qx::Airport.get_airport_id(params[:airport_4_code])

    data = {
        airport_id: airport_id,
        name: params[:name],
    }

    # @tyc_cookie = $redis.get(key)
    runway = Qx::Runway.create(data)
    render :json =>  {
      err_no: 0,
      data: runway,
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end

  def landing
    # airport_id =  Qx::Airport.where(airport_4_code: params[:airport_4_code]).last.id rescue ''
    airport_id= Qx::Airport.get_airport_id(params[:airport_4_code])

      runway_id= Qx::Runway.get_runay_id(airport_id, params[:runway])

      data = {
          airport_id: airport_id,
          runway: params[:runway],
          come_near_type: params[:come_near_type],
          come_near_normal: params[:come_near_normal],
          c_kind: params[:c_kind],
      }

      # @tyc_cookie = $redis.get(key)
      landing = Qx::Landing.create(data)

    render :json =>  {
      err_no: 0,
      data: landing,
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end

  def take_off
    # airport_id =  Qx::Airport.where(airport_4_code: params[:airport_4_code]).last.id rescue ''

    airport_id= Qx::Airport.get_airport_id(params[:airport_4_code])

    runways = params[:runway].split("/")

    p runways.size
    p runways.size
    p runways.size

    # runways.each do |runway_name|
    #   runway_id= Qx::Runway.get_runay_id(airport_id, runway_name)

    #   # @tyc_cookie = $redis.get(key)
    #   take_off = Qx::TakeOff.create(data)
    # end
    data = {
          airport_id: airport_id,
          # runway_id: runway_id,
          runway: params[:runway],
          aircraft_type: params[:aircraft_type],
          hirl_rcls: params[:hirl_rcls],
          hirl: params[:hirl],
          hirl_rcls_stop: params[:hirl_rcls_stop],
          lights: params[:lights],
      }

    take_off = Qx::TakeOff.create(data)
    render :json =>  {
      err_no: 0,
      data: "take_off",
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end

  def message
    # airport_id =  Qx::Airport.where(airport_4_code: params[:airport_4_code]).last.id rescue ''
    airport_id= Qx::Airport.get_airport_id(params[:airport_4_code])

    data = {
        airport_id: airport_id,
        content: params[:content],
        hour_tag: params[:hour_tag],
        value: params[:value],
        state: params[:state],
    }

    # @tyc_cookie = $redis.get(key)
    message = Qx::Message.create(data)
    render :json =>  {
      err_no: 0,
      data: message,
      status: {
        code: 200,
        msg: "success"
      },
    }, :status => 200
  end

  def qx

  end




end
