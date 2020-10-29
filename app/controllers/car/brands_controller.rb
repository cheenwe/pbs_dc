class Car::BrandsController < ApplicationController
  before_action :set_car_brand, only: [:show, :edit, :update, :destroy]

  # GET /car/brands
  # GET /car/brands.json
  def index
    # @car_brands = Car::Brand.all
    per_page = params[:per_page] || 100
    @q = Car::Brand.ransack(params[:q])
    @data = @q.result()
    @car_brands = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /car/brands/1
  # GET /car/brands/1.json
  def show
  end

  # GET /car/brands/new
  def new
    @car_brand = Car::Brand.new
  end

  # GET /car/brands/1/edit
  def edit
  end

  # POST /car/brands
  # POST /car/brands.json
  def create
    @car_brand = Car::Brand.new(car_brand_params)

    respond_to do |format|
      if @car_brand.save
        format.html { redirect_to @car_brand, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @car_brand }
      else
        format.html { render :new }
        format.json { render json: @car_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car/brands/1
  # PATCH/PUT /car/brands/1.json
  def update
    respond_to do |format|
      if @car_brand.update(car_brand_params)
        format.html { redirect_to @car_brand, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_brand }
      else
        format.html { render :edit }
        format.json { render json: @car_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car/brands/1
  # DELETE /car/brands/1.json
  def destroy
    @car_brand.destroy
    respond_to do |format|
      format.html { redirect_to car_brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_brand
      @car_brand = Car::Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_brand_params
      params.require(:car_brand).permit(:abbr, :name, :logo)
    end
end
