class Truck::SeriesController < ApplicationController
  before_action :set_truck_series, only: [:show, :edit, :update, :destroy]

  # GET /truck/series
  # GET /truck/series.json
  def index
    @truck_series = Truck::Serie.all
  end

  # GET /truck/series/1
  # GET /truck/series/1.json
  def show
  end

  # GET /truck/series/new
  def new
    @truck_series = Truck::Serie.new
  end

  # GET /truck/series/1/edit
  def edit
  end

  # POST /truck/series
  # POST /truck/series.json
  def create
    @truck_series = Truck::Serie.new(truck_series_params)

    respond_to do |format|
      if @truck_series.save
        format.html { redirect_to @truck_series, notice: 'Serie was successfully created.' }
        format.json { render :show, status: :created, location: @truck_series }
      else
        format.html { render :new }
        format.json { render json: @truck_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck/series/1
  # PATCH/PUT /truck/series/1.json
  def update
    respond_to do |format|
      if @truck_series.update(truck_series_params)
        format.html { redirect_to @truck_series, notice: 'Serie was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_series }
      else
        format.html { render :edit }
        format.json { render json: @truck_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck/series/1
  # DELETE /truck/series/1.json
  def destroy
    @truck_series.destroy
    respond_to do |format|
      format.html { redirect_to truck_series_url, notice: 'Serie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_series
      @truck_series = Truck::Serie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_series_params
      params.require(:truck_series).permit(:brand_id, :name)
    end
end
