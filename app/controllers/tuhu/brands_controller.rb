class Tuhu::BrandsController < ApplicationController
  before_action :set_tuhu_brand, only: [:show, :edit, :update, :destroy]

  # GET /tuhu/brands
  # GET /tuhu/brands.json
  def index
    # @tuhu_brands = Tuhu::Brand.all

    per_page = params[:per_page] || 100
    @q = Tuhu::Brand.ransack(params[:q])
    @tuhu_brands = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end


  def tuhu
  end

  # GET /tuhu/brands/1
  # GET /tuhu/brands/1.json
  def show
  end

  # GET /tuhu/brands/new
  def new
    @tuhu_brand = Tuhu::Brand.new
  end

  # GET /tuhu/brands/1/edit
  def edit
  end

  # POST /tuhu/brands
  # POST /tuhu/brands.json
  def create
    @tuhu_brand = Tuhu::Brand.new(tuhu_brand_params)

    respond_to do |format|
      if @tuhu_brand.save
        format.html { redirect_to @tuhu_brand, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @tuhu_brand }
      else
        format.html { render :new }
        format.json { render json: @tuhu_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuhu/brands/1
  # PATCH/PUT /tuhu/brands/1.json
  def update
    respond_to do |format|
      if @tuhu_brand.update(tuhu_brand_params)
        format.html { redirect_to @tuhu_brand, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuhu_brand }
      else
        format.html { render :edit }
        format.json { render json: @tuhu_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuhu/brands/1
  # DELETE /tuhu/brands/1.json
  def destroy
    @tuhu_brand.destroy
    respond_to do |format|
      format.html { redirect_to tuhu_brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuhu_brand
      @tuhu_brand = Tuhu::Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuhu_brand_params
      params.require(:tuhu_brand).permit(:name, :logo, :abbr, :reamrk)
    end
end
