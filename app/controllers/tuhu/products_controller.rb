class Tuhu::ProductsController < ApplicationController
  before_action :set_tuhu_product, only: [:show, :edit, :update, :destroy]

  # GET /tuhu/products
  # GET /tuhu/products.json
  def index
    # @tuhu_products = Tuhu::Product.all
    per_page = params[:per_page] || 100
    if params[:detail_id].present?

      @tuhu_detail = Tuhu::Detail.find(params[:detail_id])
      @tuhu_products =  @tuhu_detail.products.paginate(:page => params[:page], :per_page => per_page)

    else

      @q = Tuhu::Product.ransack(params[:q])
      @tuhu_products = @q.result().paginate(:page => params[:page], :per_page => per_page)
    end
    

  end

  # GET /tuhu/products/1
  # GET /tuhu/products/1.json
  def show
  end

  # GET /tuhu/products/new
  def new
    @tuhu_product = Tuhu::Product.new
  end

  # GET /tuhu/products/1/edit
  def edit
  end

  # POST /tuhu/products
  # POST /tuhu/products.json
  def create
    @tuhu_product = Tuhu::Product.new(tuhu_product_params)

    respond_to do |format|
      if @tuhu_product.save
        format.html { redirect_to @tuhu_product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @tuhu_product }
      else
        format.html { render :new }
        format.json { render json: @tuhu_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuhu/products/1
  # PATCH/PUT /tuhu/products/1.json
  def update
    respond_to do |format|
      if @tuhu_product.update(tuhu_product_params)
        format.html { redirect_to @tuhu_product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuhu_product }
      else
        format.html { render :edit }
        format.json { render json: @tuhu_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuhu/products/1
  # DELETE /tuhu/products/1.json
  def destroy
    @tuhu_product.destroy
    respond_to do |format|
      format.html { redirect_to tuhu_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuhu_product
      @tuhu_product = Tuhu::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuhu_product_params
      params.require(:tuhu_product).permit(:kind_id, :img, :name, :price, :category, :url, :remark)
    end
end
