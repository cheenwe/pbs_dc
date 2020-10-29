class Car::SeriesController < ApplicationController
  before_action :set_car_series, only: [:show, :edit, :update, :destroy]

  # GET /car/series
  # GET /car/series.json
  def index
    # @car_series = Car::Serie.all
    per_page = params[:per_page] || 100
    @q = Car::Serie.ransack(params[:q])
    @data = @q.result()
    @car_series = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /car/series/1
  # GET /car/series/1.json
  def show
  end

  # GET /car/series/new
  def new
    @car_series = Car::Serie.new
  end

  # GET /car/series/1/edit
  def edit
  end

  # POST /car/series
  # POST /car/series.json
  def create
    @car_series = Car::Serie.new(car_series_params)

    respond_to do |format|
      if @car_series.save
        format.html { redirect_to @car_series, notice: 'Serie was successfully created.' }
        format.json { render :show, status: :created, location: @car_series }
      else
        format.html { render :new }
        format.json { render json: @car_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car/series/1
  # PATCH/PUT /car/series/1.json
  def update
    respond_to do |format|
      if @car_series.update(car_series_params)
        format.html { redirect_to @car_series, notice: 'Serie was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_series }
      else
        format.html { render :edit }
        format.json { render json: @car_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car/series/1
  # DELETE /car/series/1.json
  def destroy
    @car_series.destroy
    respond_to do |format|
      format.html { redirect_to car_series_url, notice: 'Serie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_series
      @car_series = Car::Serie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_series_params
      params.require(:car_series).permit(:brand_id, :name, :url)
    end
end
