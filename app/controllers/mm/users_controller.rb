class Mm::UsersController < ApplicationController

  before_action :set_mm_user, only: [:show, :edit, :update, :destroy, :clone]
  before_action :check_bulks, only: [:bulks]
  before_action :set_bulk_mm_users, only: [:bulks, :bulk_destroy, :bulk_update]

  # layout "base", only: [:select]

  # GET /mm/users
  def index
    mm_users = Mm::User.order("id desc")
    @q = mm_users.ransack(params[:q])
    @mm_users = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])

    respond_to do |format|
      format.html { render :index }
      format.json { render json: {code: "200", success: 1 , msg: "ok", data: @mm_users, meta: { total: @mm_users.total_entries, per_page: per_page, page: page }}}
    end
  end

  # GET /mm/users/1
  def show

    respond_to do |format|
      format.json { render json: {code: "200",success: 1 ,msg: "ok", data: @mm_user} }
      format.html { render :show }
    end
  end

  # GET /mm/users/new
  def new
    @mm_user = Mm::User.new
  end

  # GET /mm_user/1/edit
  def edit
  end

  # POST /mm/users
  def create
    @mm_user = Mm::User.new(mm_user_params)
    #@mm_user.user_id = current_user.id  rescue ''
    #@mm_user.department_id = current_user.department_id

    respond_to do |format|
      if @mm_user.save
        @back_url = set_back_url(@mm_user)
        format.json { render json: {code: "200", success: 1, msg: t('create_success'), data: @mm_user } }
        format.html { redirect_to @mm_user, notice: t('create_success')   }
      else
        flash.now[:alert] = @mm_user.errors.full_messages
        format.html { render :new }
        format.json { render json: { code: "500", success: 0 , msg: @mm_user.errors.full_messages, data: ""}}
      end
    end
  end

  # PATCH/PUT /mm_user/1
  def update
    respond_to do |format|
      if @mm_user.update(mm_user_params)
        @back_url = set_back_url(@mm_user)
        format.html { redirect_to @mm_user, notice: t('update_success')   }
        format.json { render json: { code: "200", success: 1 , msg: "ok", data: @mm_user}}
      else
        flash.now[:alert] = @mm_user.errors.full_messages
        format.html { render :edit }
        format.json { render json: { code: "500", success: 0 , msg: @mm_user.errors.full_messages, data: ""}}
      end
    end
  end

  # DELETE /mm/users/1
  def destroy
    @mm_user.destroy
    respond_to do |format|
      format.html { redirect_to "/mm/users", notice:  t('destroy_success')  }
      format.json { render json: { code: "200", success: 1 , msg: "success", data: ""}}
    end
  end

  # POST /mm/users/bulk_destroy
  # 批量删除
  def bulk_destroy
    @mm_users.destroy_all
    size = @mm_users.size
    message =  t("bulk_action_success", action: "#{t('destroy')}", size: size)

    respond_to do |format|
      format.json { render json: {code: "200", success: 1, msg: message, data: ""} }
      format.html { redirect_to @back_url, notice: message }
    end
  end

  # POST /mm/users/bulks
  # 批量操作
  def bulks
    @back_url = params[:back_url].present?? params[:back_url]:"/mm/users"
    size = @mm_users.size
    if params[:bulk_action] == "destroy"
      bulk_destroy
    end
  end

  private
    def set_mm_user
      @mm_user = Mm::User.find(params[:id])
    end

    def check_bulks
      if request.get?
        redirect_to "/mm/users", notice: t("select_data_then_bulk")
      end
    end

    def set_bulk_mm_users
      @mm_users = Mm::User.where(id: params[:bulk_ids]).order("id desc")
    end

    def mm_user_params
      params.require(:mm_user).permit(:name)
    end

    def set_back_url(mm_user)
      if (params[:next] == 'back' and params[:action] == "create")
        "/mm/users/new"
      elsif (params[:next] == 'back' and params[:action] == "update")
        "/mm/users/#{mm_user.id}/edit"
      elsif params[:next] == 'new'
        "/mm/users/new"
      elsif params[:next] == 'index'
        "/mm/users"
      elsif params[:next] == 'clone'
        "/mm/users/#{mm_user.id}/clone"
      else
        mm_user
      end
    end

end

