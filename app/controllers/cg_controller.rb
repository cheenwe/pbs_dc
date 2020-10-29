class CgController < ActionController::API
 
    def gonggao

        key_id = Cg::Key.get_key_id(params[:key])
  
        data = {
            kind: params[:kind],
            title: params[:title],
            date_at: params[:date_at],
            buyer: params[:buyer],
            agent: params[:agent],
            category: params[:category],
            area: params[:area],
            desc: params[:desc],
            url: params[:url],
            key_id: key_id,
        }
          
        gonggao = Cg::Gonggao.create(data) 
  
      render :json =>  {
        err_no: 0,
        data: gonggao,
        status: {
          code: 200,
          msg: "success"
        },
      }, :status => 200
    end

end
