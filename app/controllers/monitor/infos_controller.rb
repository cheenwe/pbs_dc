class Monitor::InfosController < ApplicationController
  before_action :set_monitor_info, only: [:show, :edit, :update, :destroy]

  # GET /monitor/infos
  # GET /monitor/infos.json
  def index
    # @monitor_infos = Monitor::Info.all

    @q = Monitor::Info.order("id DESC").ransack(params[:q])
    @datas = @q.result()
    @monitor_infos = @datas.paginate(:page => params[:page], :per_page => 30) 
  end

  # GET /monitor/infos/1
  # GET /monitor/infos/1.json
  def show
  end

  # GET /monitor/infos/new
  def new
    @monitor_info = Monitor::Info.new
  end

  # GET /monitor/infos/1/edit
  def edit
  end

  # POST /monitor/infos
  # POST /monitor/infos.json
  def create
    @monitor_info = Monitor::Info.new(monitor_info_params)

    respond_to do |format|
      if @monitor_info.save
        format.html { redirect_to @monitor_info, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @monitor_info }
      else
        format.html { render :new }
        format.json { render json: @monitor_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monitor/infos/1
  # PATCH/PUT /monitor/infos/1.json
  def update
    respond_to do |format|
      if @monitor_info.update(monitor_info_params)
        format.html { redirect_to @monitor_info, notice: 'Info was successfully updated.' }
        format.json { render :show, status: :ok, location: @monitor_info }
      else
        format.html { render :edit }
        format.json { render json: @monitor_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitor/infos/1
  # DELETE /monitor/infos/1.json
  def destroy
    @monitor_info.destroy
    respond_to do |format|
      format.html { redirect_to monitor_infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitor_info
      @monitor_info = Monitor::Info.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monitor_info_params
      params.require(:monitor_info).permit(:server_id, :info, :remark)
    end
end
