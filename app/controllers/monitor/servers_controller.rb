class Monitor::ServersController < ApplicationController
  before_action :set_monitor_server, only: [:show, :edit, :update, :destroy]

  # GET /monitor/servers
  # GET /monitor/servers.json
  def index
    # @monitor_servers = Monitor::Server.all

    @q = Monitor::Server.order("id DESC").ransack(params[:q])
    @datas = @q.result()
    @monitor_servers = @datas.paginate(:page => params[:page], :per_page => 30) 
  end

  # GET /monitor/servers/1
  # GET /monitor/servers/1.json
  def show
  end

  # GET /monitor/servers/new
  def new
    @monitor_server = Monitor::Server.new
  end

  # GET /monitor/servers/1/edit
  def edit
  end

  # POST /monitor/servers
  # POST /monitor/servers.json
  def create
    @monitor_server = Monitor::Server.new(monitor_server_params)

    respond_to do |format|
      if @monitor_server.save
        format.html { redirect_to @monitor_server, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @monitor_server }
      else
        format.html { render :new }
        format.json { render json: @monitor_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monitor/servers/1
  # PATCH/PUT /monitor/servers/1.json
  def update
    respond_to do |format|
      if @monitor_server.update(monitor_server_params)
        format.html { redirect_to @monitor_server, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @monitor_server }
      else
        format.html { render :edit }
        format.json { render json: @monitor_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitor/servers/1
  # DELETE /monitor/servers/1.json
  def destroy
    @monitor_server.destroy
    respond_to do |format|
      format.html { redirect_to monitor_servers_url, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitor_server
      @monitor_server = Monitor::Server.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monitor_server_params
      params.require(:monitor_server).permit(:name, :ip, :remark)
    end
end
