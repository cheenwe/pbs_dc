class Qx::InfosController < ApplicationController
  before_action :set_qx_info, only: [:show, :edit, :update, :destroy]

  # GET /qx/infos
  # GET /qx/infos.json
  def index
    @qx_infos = Qx::Info.all.order("id DESC")

    @q = @qx_infos.ransack(params[:q])

    @qx_infos = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])
  end


  def liuliang

    @qx_infos = Qx::Info.all

    p  date = params[:date]
    @hash = []
    (0..23).each do |hour|
      up_size = @qx_infos.where(up_at: ["#{date} #{hour}:00:00".."#{date} #{hour}:59:59"]).size
      down_size = @qx_infos.where(down_at: ["#{date} #{hour}:00:00".."#{date} #{hour}:59:59"]).size
      @hash << {
        hour: hour,
        up_size: up_size,
        down_size: down_size,
      }
      # p ("#{date} #{hour}:00:00".."#{date} #{hour}:59:59")
      # p  @qx_infos.where(up_at: ["#{date} #{hour}:00:00".."#{date} #{hour}:59:59"]).size
    end
    p @hash
  end
  # GET /qx/infos/1
  # GET /qx/infos/1.json
  def show
  end

  # GET /qx/infos/new
  def new
    @qx_info = Qx::Info.new
  end

  # GET /qx/infos/1/edit
  def edit
  end

  # POST /qx/infos
  # POST /qx/infos.json
  def create
    @qx_info = Qx::Info.new(qx_info_params)

    respond_to do |format|
      if @qx_info.save
        format.html { redirect_to @qx_info, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @qx_info }
      else
        format.html { render :new }
        format.json { render json: @qx_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qx/infos/1
  # PATCH/PUT /qx/infos/1.json
  def update
    respond_to do |format|
      if @qx_info.update(qx_info_params)
        format.html { redirect_to @qx_info, notice: 'Info was successfully updated.' }
        format.json { render :show, status: :ok, location: @qx_info }
      else
        format.html { render :edit }
        format.json { render json: @qx_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qx/infos/1
  # DELETE /qx/infos/1.json
  def destroy
    @qx_info.destroy
    respond_to do |format|
      format.html { redirect_to qx_infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qx_info
      @qx_info = Qx::Info.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qx_info_params
      params.require(:qx_info).permit(:name, :up_at, :down_at)
    end
end
