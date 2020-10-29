class Car::DetailsController < ApplicationController
  before_action :set_car_detail, only: [:show, :edit, :update, :destroy]

  # GET /car/details
  # GET /car/details.json
  def index
    # @car_details = Car::Detail.all
    per_page = params[:per_page] || 100
    @q = Car::Detail.ransack(params[:q])
    @data = @q.result()
    @car_details = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  def search
    per_page = params[:per_page] || 300
    @q = Car::Param.ransack(params[:q])
    @data = @q.result()
    @car_params = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  def param
    per_page = params[:per_page] || 100
    @q = Car::One_param.ransack(params[:q])
    @data = @q.result()
    @car_params = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  def root
  end
  # GET /car/details/1
  # GET /car/details/1.json
  def show
  end

  # GET /car/details/new
  def new
    @car_detail = Car::Detail.new
  end

  # GET /car/details/1/edit
  def edit
  end

  # POST /car/details
  # POST /car/details.json
  def create
    @car_detail = Car::Detail.new(car_detail_params)

    respond_to do |format|
      if @car_detail.save
        format.html { redirect_to @car_detail, notice: 'Detail was successfully created.' }
        format.json { render :show, status: :created, location: @car_detail }
      else
        format.html { render :new }
        format.json { render json: @car_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car/details/1
  # PATCH/PUT /car/details/1.json
  def update
    respond_to do |format|
      if @car_detail.update(car_detail_params)
        format.html { redirect_to @car_detail, notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_detail }
      else
        format.html { render :edit }
        format.json { render json: @car_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car/details/1
  # DELETE /car/details/1.json
  def destroy
    @car_detail.destroy
    respond_to do |format|
      format.html { redirect_to car_details_url, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_detail
      @car_detail = Car::Detail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_detail_params
      params.require(:car_detail).permit(:item_id, :detail_id, :key, :value)
    end
end
