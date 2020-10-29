class Truck::DetailsController < ApplicationController
  before_action :set_truck_detail, only: [:show, :edit, :update, :destroy]

  # GET /truck/details
  # GET /truck/details.json
  def index
    @truck_details = Truck::Detail.all
  end

  # GET /truck/details/1
  # GET /truck/details/1.json
  def show
  end

  # GET /truck/details/new
  def new
    @truck_detail = Truck::Detail.new
  end

  # GET /truck/details/1/edit
  def edit
  end

  # POST /truck/details
  # POST /truck/details.json
  def create
    @truck_detail = Truck::Detail.new(truck_detail_params)

    respond_to do |format|
      if @truck_detail.save
        format.html { redirect_to @truck_detail, notice: 'Detail was successfully created.' }
        format.json { render :show, status: :created, location: @truck_detail }
      else
        format.html { render :new }
        format.json { render json: @truck_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck/details/1
  # PATCH/PUT /truck/details/1.json
  def update
    respond_to do |format|
      if @truck_detail.update(truck_detail_params)
        format.html { redirect_to @truck_detail, notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_detail }
      else
        format.html { render :edit }
        format.json { render json: @truck_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck/details/1
  # DELETE /truck/details/1.json
  def destroy
    @truck_detail.destroy
    respond_to do |format|
      format.html { redirect_to truck_details_url, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_detail
      @truck_detail = Truck::Detail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_detail_params
      params.require(:truck_detail).permit(:item_id, :config_id, :value)
    end
end
