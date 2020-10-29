class Qx::WeathersController < ApplicationController
  before_action :set_qx_weather, only: [:show, :edit, :update, :destroy]

  # GET /qx/weathers
  # GET /qx/weathers.json
  def index 
    # @qx_weathers = Qx::Weather.all

    per_page = params[:per_page] || 100
    @q = Qx::Weather.ransack(params[:q])
    @qx_weathers = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /qx/weathers/1
  # GET /qx/weathers/1.json
  def show
  end

  # GET /qx/weathers/new
  def new
    @qx_weather = Qx::Weather.new
  end

  # GET /qx/weathers/1/edit
  def edit
  end

  # POST /qx/weathers
  # POST /qx/weathers.json
  def create
    @qx_weather = Qx::Weather.new(qx_weather_params)

    respond_to do |format|
      if @qx_weather.save
        format.html { redirect_to @qx_weather, notice: 'Weather was successfully created.' }
        format.json { render :show, status: :created, location: @qx_weather }
      else
        format.html { render :new }
        format.json { render json: @qx_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qx/weathers/1
  # PATCH/PUT /qx/weathers/1.json
  def update
    respond_to do |format|
      if @qx_weather.update(qx_weather_params)
        format.html { redirect_to @qx_weather, notice: 'Weather was successfully updated.' }
        format.json { render :show, status: :ok, location: @qx_weather }
      else
        format.html { render :edit }
        format.json { render json: @qx_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qx/weathers/1
  # DELETE /qx/weathers/1.json
  def destroy
    @qx_weather.destroy
    respond_to do |format|
      format.html { redirect_to qx_weathers_url, notice: 'Weather was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qx_weather
      @qx_weather = Qx::Weather.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qx_weather_params
      params.require(:qx_weather).permit(:airport_id, :hour_tag, :value, :content, :state)
    end
end
