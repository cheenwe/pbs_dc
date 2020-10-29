class Cg::GonggaosController < ApplicationController
  # layout "simple"

  before_action :set_cg_gonggao, only: [:show, :edit, :update, :destroy]

  # GET /cg/gonggaos
  # GET /cg/gonggaos.json
  def index

    if params[:export] == "1"

      kind_ids = Cg::Kind.where(is_show:1).map{|e|e.id}
      gk_ids = Cg::GonggaosKind.where(kind_id: kind_ids).map{|e|e.gonggao_id}

      q = params[:q]

      @q = Cg::Gonggao.where(id:gk_ids).includes(:key).ransack(q)
      @cg_gonggaos = @q.result()

      cg_export(@cg_gonggaos)

    else

      kind_ids = Cg::Kind.where(is_show:1).map{|e|e.id}
      gk_ids = Cg::GonggaosKind.where(kind_id: kind_ids).map{|e|e.gonggao_id}

      q = params[:q]

      per_page = params[:per_page] || 100
      @q = Cg::Gonggao.order("id desc").where(id:gk_ids).includes(:key).ransack(q)
      @cg_gonggaos = @q.result()
      @total_size = @cg_gonggaos.size
      @cg_gonggaos = @cg_gonggaos.paginate(:page => params[:page], :per_page => per_page)

    end
  end

  # GET /cg/gonggaos/1
  # GET /cg/gonggaos/1.json
  def show
  end

  # GET /cg/gonggaos/new
  def new
    @cg_gonggao = Cg::Gonggao.new
  end

  # GET /cg/gonggaos/1/edit
  def edit
  end

  # POST /cg/gonggaos
  # POST /cg/gonggaos.json
  def create
    @cg_gonggao = Cg::Gonggao.new(cg_gonggao_params)

    respond_to do |format|
      if @cg_gonggao.save
        format.html { redirect_to @cg_gonggao, notice: 'Gonggao was successfully created.' }
        format.json { render :show, status: :created, location: @cg_gonggao }
      else
        format.html { render :new }
        format.json { render json: @cg_gonggao.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /cg/gonggaos/1
  # PATCH/PUT /cg/gonggaos/1.json
  def update
    respond_to do |format|
      if @cg_gonggao.update(cg_gonggao_params)
        format.html { redirect_to @cg_gonggao, notice: 'Gonggao was successfully updated.' }
        format.json { render :show, status: :ok, location: @cg_gonggao }
      else
        format.html { render :edit }
        format.json { render json: @cg_gonggao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cg/gonggaos/1
  # DELETE /cg/gonggaos/1.json
  def destroy
    @cg_gonggao.destroy
    respond_to do |format|
      format.html { redirect_to cg_gonggaos_url, notice: 'Gonggao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #
  def cg_export(data)

    url = "tmp/export_采购公告_#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
    file = "#{Rails.root}/" + url

    format = Spreadsheet::Format.new :color => :black,
                                     :size => 10

    book = Spreadsheet::Workbook.new file
    Spreadsheet
    j=0
    Cg::Key.all.each do |key|

      sheet1 = book.worksheet j
      sheet1 = book.create_worksheet :name => key.name

      sheet1.row(0).concat %w{分类 标题 日期 采购人 代理 种类 区域 描述 URL 类别}
      i=1
        datas = data.where(key_id:key.id)
        datas.each do |item|

        sheet1.row(i).default_format = format

          sheet1.row(i).concat ["#{item.kind}", "#{item.title}", "#{item.date_at.strftime('%Y-%m-%d %H:%M')}", "#{item.buyer}", "#{item.agent}", "#{item.category}", "#{item.area}", "#{item.desc}", "#{item.url}", "#{item.key.name rescue ''}" ]
          i=i+1
        end
        j=j+1
    end

      book.write file
      send_file file
      # render json: {body: @datas, url: "#{Settings.base_url}" + url}
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cg_gonggao
      @cg_gonggao = Cg::Gonggao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cg_gonggao_params
      params.require(:cg_gonggao).permit(:kind, :title, :date_at, :buyer, :agent, :category, :area, :desc, :url, :key_id)
    end
end
