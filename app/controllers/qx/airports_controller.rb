class Qx::AirportsController < ApplicationController
  before_action :set_qx_airport, only: [:show, :edit, :update, :destroy]

  # GET /qx/airports
  # GET /qx/airports.json
  def index
    # @qx_airports = Qx::Airport.all

    per_page = params[:per_page] || 100
    @q = Qx::Airport.ransack(params[:q])
    @qx_airports = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /qx/airports/1
  # GET /qx/airports/1.json
  def show
  end

  # GET /qx/airports/new
  def new
    @qx_airport = Qx::Airport.new
  end

  # GET /qx/airports/1/edit
  def edit
  end

  # POST /qx/airports
  # POST /qx/airports.json
  def create
    @qx_airport = Qx::Airport.new(qx_airport_params)

    respond_to do |format|
      if @qx_airport.save
        format.html { redirect_to @qx_airport, notice: 'Airport was successfully created.' }
        format.json { render :show, status: :created, location: @qx_airport }
      else
        format.html { render :new }
        format.json { render json: @qx_airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qx/airports/1
  # PATCH/PUT /qx/airports/1.json
  def update
    respond_to do |format|
      if @qx_airport.update(qx_airport_params)
        format.html { redirect_to @qx_airport, notice: 'Airport was successfully updated.' }
        format.json { render :show, status: :ok, location: @qx_airport }
      else
        format.html { render :edit }
        format.json { render json: @qx_airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qx/airports/1
  # DELETE /qx/airports/1.json
  def destroy
    @qx_airport.destroy
    respond_to do |format|
      format.html { redirect_to qx_airports_url, notice: 'Airport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qx_airport
      @qx_airport = Qx::Airport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qx_airport_params
      params.require(:qx_airport).permit(:city_name, :airport_3_code, :city_ch_ame, :country_name, :airport_4_code, :airport_name, :english_name, :longgitude, :latitude)
    end
end
