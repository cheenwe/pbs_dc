class Truck::BrandsController < ApplicationController
  before_action :set_truck_brand, only: [:show, :edit, :update, :destroy]

  # GET /truck/brands
  # GET /truck/brands.json
  def index
    @truck_brands = Truck::Brand.all
  end

  # GET /truck/brands/1
  # GET /truck/brands/1.json
  def show
  end

  # GET /truck/brands/new
  def new
    @truck_brand = Truck::Brand.new
  end

  # GET /truck/brands/1/edit
  def edit
  end

  # POST /truck/brands
  # POST /truck/brands.json
  def create
    @truck_brand = Truck::Brand.new(truck_brand_params)

    respond_to do |format|
      if @truck_brand.save
        format.html { redirect_to @truck_brand, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @truck_brand }
      else
        format.html { render :new }
        format.json { render json: @truck_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck/brands/1
  # PATCH/PUT /truck/brands/1.json
  def update
    respond_to do |format|
      if @truck_brand.update(truck_brand_params)
        format.html { redirect_to @truck_brand, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_brand }
      else
        format.html { render :edit }
        format.json { render json: @truck_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck/brands/1
  # DELETE /truck/brands/1.json
  def destroy
    @truck_brand.destroy
    respond_to do |format|
      format.html { redirect_to truck_brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_brand
      @truck_brand = Truck::Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_brand_params
      params.require(:truck_brand).permit(:abbr, :name, :logo)
    end
end
