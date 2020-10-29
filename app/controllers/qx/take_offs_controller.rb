class Qx::TakeOffsController < ApplicationController
  before_action :set_qx_take_off, only: [:show, :edit, :update, :destroy]

  # GET /qx/take_offs
  # GET /qx/take_offs.json
  def index
    # @qx_take_offs = Qx::TakeOff.all
    
    per_page = params[:per_page] || 100
    @q = Qx::TakeOff.ransack(params[:q])
    @qx_take_offs = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /qx/take_offs/1
  # GET /qx/take_offs/1.json
  def show
  end

  # GET /qx/take_offs/new
  def new
    @qx_take_off = Qx::TakeOff.new
  end

  # GET /qx/take_offs/1/edit
  def edit
  end

  # POST /qx/take_offs
  # POST /qx/take_offs.json
  def create
    runway = qx_take_off_params[:runway].split("/")
    runway.each do |item|
      qx_take_off_params[:runway_id] = Qx::Runway.get_runay_id(qx_take_off_params[:airport_id], item)
      @qx_take_off = Qx::TakeOff.new(qx_take_off_params)
    end


    p runway

    respond_to do |format|
      if @qx_take_off.save
        format.html { redirect_to @qx_take_off, notice: 'Take off was successfully created.' }
        format.json { render :show, status: :created, location: @qx_take_off }
      else
        format.html { render :new }
        format.json { render json: @qx_take_off.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_runway
    @qx_landing = Qx::Landing.new(qx_landing_params)
  end

  # PATCH/PUT /qx/take_offs/1
  # PATCH/PUT /qx/take_offs/1.json
  def update
    respond_to do |format|
      if @qx_take_off.update(qx_take_off_params)
        format.html { redirect_to @qx_take_off, notice: 'Take off was successfully updated.' }
        format.json { render :show, status: :ok, location: @qx_take_off }
      else
        format.html { render :edit }
        format.json { render json: @qx_take_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qx/take_offs/1
  # DELETE /qx/take_offs/1.json
  def destroy
    @qx_take_off.destroy
    respond_to do |format|
      format.html { redirect_to qx_take_offs_url, notice: 'Take off was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qx_take_off
      @qx_take_off = Qx::TakeOff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qx_take_off_params
      params.require(:qx_take_off).permit(:airport_id, :runway, :aircraft_type, :hirl_rcls, :hirl, :hirl_rcls_stop, :lights)
    end
end
