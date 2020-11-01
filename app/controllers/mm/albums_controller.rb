class Mm::AlbumsController < ApplicationController

  before_action :set_mm_album, only: [:show, :edit, :update, :destroy, :clone]
  before_action :check_bulks, only: [:bulks]
  before_action :set_bulk_mm_albums, only: [:bulks, :bulk_destroy, :bulk_update]

  # layout "base", only: [:select]

  # GET /mm/albums
  def index
    mm_albums = Mm::Album.order("id desc")
    @q = mm_albums.ransack(params[:q])
    @mm_albums = @q.result().paginate(:page => params[:page], :per_page => params[:per_page], :total_entries =>  Mm::Album.total_entries)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: {code: "200", success: 1 , msg: "ok", data: @mm_albums, meta: { total: @mm_albums.total_entries, per_page: per_page, page: page }}}
    end
  end

  # GET /mm/albums/1
  def show

    respond_to do |format|
      format.json { render json: {code: "200",success: 1 ,msg: "ok", data: @mm_album} }
      format.html { render :show }
    end
  end

  # GET /mm/albums/new
  def new
    @mm_album = Mm::Album.new
  end

  # GET /mm_album/1/edit
  def edit
  end

  # POST /mm/albums
  def create
    @mm_album = Mm::Album.new(mm_album_params)
    #@mm_album.user_id = current_user.id  rescue ''
    #@mm_album.department_id = current_user.department_id

    respond_to do |format|
      if @mm_album.save
        @back_url = set_back_url(@mm_album)
        format.json { render json: {code: "200", success: 1, msg: t('create_success'), data: @mm_album } }
        format.html { redirect_to @mm_album, notice: t('create_success')   }
      else
        flash.now[:alert] = @mm_album.errors.full_messages
        format.html { render :new }
        format.json { render json: { code: "500", success: 0 , msg: @mm_album.errors.full_messages, data: ""}}
      end
    end
  end

  # PATCH/PUT /mm_album/1
  def update
    respond_to do |format|
      if @mm_album.update(mm_album_params)
        @back_url = set_back_url(@mm_album)
        format.html { redirect_to @mm_album, notice: t('update_success')   }
        format.json { render json: { code: "200", success: 1 , msg: "ok", data: @mm_album}}
      else
        flash.now[:alert] = @mm_album.errors.full_messages
        format.html { render :edit }
        format.json { render json: { code: "500", success: 0 , msg: @mm_album.errors.full_messages, data: ""}}
      end
    end
  end

  # DELETE /mm/albums/1
  def destroy
    @mm_album.destroy
    respond_to do |format|
      format.html { redirect_to "/mm/albums", notice:  t('destroy_success')  }
      format.json { render json: { code: "200", success: 1 , msg: "success", data: ""}}
    end
  end

  # POST /mm/albums/bulk_destroy
  # 批量删除
  def bulk_destroy
    @mm_albums.destroy_all
    size = @mm_albums.size
    message =  t("bulk_action_success", action: "#{t('destroy')}", size: size)

    respond_to do |format|
      format.json { render json: {code: "200", success: 1, msg: message, data: ""} }
      format.html { redirect_to @back_url, notice: message }
    end
  end

  # POST /mm/albums/bulks
  # 批量操作
  def bulks
    @back_url = params[:back_url].present?? params[:back_url]:"/mm/albums"
    size = @mm_albums.size
    if params[:bulk_action] == "destroy"
      bulk_destroy
    end
  end

  private
    def set_mm_album
      @mm_album = Mm::Album.find(params[:id])
    end

    def check_bulks
      if request.get?
        redirect_to "/mm/albums", notice: t("select_data_then_bulk")
      end
    end

    def set_bulk_mm_albums
      @mm_albums = Mm::Album.where(id: params[:bulk_ids]).order("id desc")
    end

    def mm_album_params
      params.require(:mm_album).permit(:user_id, :name, :total, :kind)
    end

    def set_back_url(mm_album)
      if (params[:next] == 'back' and params[:action] == "create")
        "/mm/albums/new"
      elsif (params[:next] == 'back' and params[:action] == "update")
        "/mm/albums/#{mm_album.id}/edit"
      elsif params[:next] == 'new'
        "/mm/albums/new"
      elsif params[:next] == 'index'
        "/mm/albums"
      elsif params[:next] == 'clone'
        "/mm/albums/#{mm_album.id}/clone"
      else
        mm_album
      end
    end

end

