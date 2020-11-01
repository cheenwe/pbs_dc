class Mm::PhotosController < ApplicationController

  before_action :set_mm_photo, only: [:show, :edit, :update, :destroy, :clone]
  before_action :check_bulks, only: [:bulks]
  before_action :set_bulk_mm_photos, only: [:bulks, :bulk_destroy, :bulk_update]

  # layout "base", only: [:select]

  # GET /mm/photos
  def index
    mm_photos = Mm::Photo.order("id desc")
    @q = mm_photos.ransack(params[:q])
    @mm_photos = @q.result().paginate(:page => params[:page], :per_page => params[:per_page], :total_entries =>  Mm::Photo.total_entries)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: {code: "200", success: 1 , msg: "ok", data: @mm_photos, meta: { total: @mm_photos.total_entries, per_page: per_page, page: page }}}
    end
  end

  # GET /mm/photos/1
  def show

    respond_to do |format|
      format.json { render json: {code: "200",success: 1 ,msg: "ok", data: @mm_photo} }
      format.html { render :show }
    end
  end

  # GET /mm/photos/new
  def new
    @mm_photo = Mm::Photo.new
  end

  # GET /mm_photo/1/edit
  def edit
  end

  # POST /mm/photos
  def create
    @mm_photo = Mm::Photo.new(mm_photo_params)
    #@mm_photo.user_id = current_user.id  rescue ''
    #@mm_photo.department_id = current_user.department_id

    respond_to do |format|
      if @mm_photo.save
        @back_url = set_back_url(@mm_photo)
        format.json { render json: {code: "200", success: 1, msg: t('create_success'), data: @mm_photo } }
        format.html { redirect_to @mm_photo, notice: t('create_success')   }
      else
        flash.now[:alert] = @mm_photo.errors.full_messages
        format.html { render :new }
        format.json { render json: { code: "500", success: 0 , msg: @mm_photo.errors.full_messages, data: ""}}
      end
    end
  end

  # PATCH/PUT /mm_photo/1
  def update
    respond_to do |format|
      if @mm_photo.update(mm_photo_params)
        @back_url = set_back_url(@mm_photo)
        format.html { redirect_to @mm_photo, notice: t('update_success')   }
        format.json { render json: { code: "200", success: 1 , msg: "ok", data: @mm_photo}}
      else
        flash.now[:alert] = @mm_photo.errors.full_messages
        format.html { render :edit }
        format.json { render json: { code: "500", success: 0 , msg: @mm_photo.errors.full_messages, data: ""}}
      end
    end
  end

  # DELETE /mm/photos/1
  def destroy
    @mm_photo.destroy
    respond_to do |format|
      format.html { redirect_to "/mm/photos", notice:  t('destroy_success')  }
      format.json { render json: { code: "200", success: 1 , msg: "success", data: ""}}
    end
  end

  # POST /mm/photos/bulk_destroy
  # 批量删除
  def bulk_destroy
    @mm_photos.destroy_all
    size = @mm_photos.size
    message =  t("bulk_action_success", action: "#{t('destroy')}", size: size)

    respond_to do |format|
      format.json { render json: {code: "200", success: 1, msg: message, data: ""} }
      format.html { redirect_to @back_url, notice: message }
    end
  end

  # POST /mm/photos/bulks
  # 批量操作
  def bulks
    @back_url = params[:back_url].present?? params[:back_url]:"/mm/photos"
    size = @mm_photos.size
    if params[:bulk_action] == "destroy"
      bulk_destroy
    end
  end

  private
    def set_mm_photo
      @mm_photo = Mm::Photo.find(params[:id])
    end

    def check_bulks
      if request.get?
        redirect_to "/mm/photos", notice: t("select_data_then_bulk")
      end
    end

    def set_bulk_mm_photos
      @mm_photos = Mm::Photo.where(id: params[:bulk_ids]).order("id desc")
    end

    def mm_photo_params
      params.require(:mm_photo).permit(:album_id, :name, :url, :kind)
    end

    def set_back_url(mm_photo)
      if (params[:next] == 'back' and params[:action] == "create")
        "/mm/photos/new"
      elsif (params[:next] == 'back' and params[:action] == "update")
        "/mm/photos/#{mm_photo.id}/edit"
      elsif params[:next] == 'new'
        "/mm/photos/new"
      elsif params[:next] == 'index'
        "/mm/photos"
      elsif params[:next] == 'clone'
        "/mm/photos/#{mm_photo.id}/clone"
      else
        mm_photo
      end
    end

end

