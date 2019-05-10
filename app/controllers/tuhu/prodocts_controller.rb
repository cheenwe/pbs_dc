class Tuhu::ProdoctsController < ApplicationController
  before_action :set_tuhu_prodoct, only: [:show, :edit, :update, :destroy]

  # GET /tuhu/prodocts
  # GET /tuhu/prodocts.json
  def index
    # @tuhu_prodocts = Tuhu::Prodoct.all

    per_page = params[:per_page] || 100
    @q = Tuhu::Prodoct.ransack(params[:q])
    @tuhu_prodocts = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /tuhu/prodocts/1
  # GET /tuhu/prodocts/1.json
  def show
  end

  # GET /tuhu/prodocts/new
  def new
    @tuhu_prodoct = Tuhu::Prodoct.new
  end

  # GET /tuhu/prodocts/1/edit
  def edit
  end

  # POST /tuhu/prodocts
  # POST /tuhu/prodocts.json
  def create
    @tuhu_prodoct = Tuhu::Prodoct.new(tuhu_prodoct_params)

    respond_to do |format|
      if @tuhu_prodoct.save
        format.html { redirect_to @tuhu_prodoct, notice: 'Prodoct was successfully created.' }
        format.json { render :show, status: :created, location: @tuhu_prodoct }
      else
        format.html { render :new }
        format.json { render json: @tuhu_prodoct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuhu/prodocts/1
  # PATCH/PUT /tuhu/prodocts/1.json
  def update
    respond_to do |format|
      if @tuhu_prodoct.update(tuhu_prodoct_params)
        format.html { redirect_to @tuhu_prodoct, notice: 'Prodoct was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuhu_prodoct }
      else
        format.html { render :edit }
        format.json { render json: @tuhu_prodoct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuhu/prodocts/1
  # DELETE /tuhu/prodocts/1.json
  def destroy
    @tuhu_prodoct.destroy
    respond_to do |format|
      format.html { redirect_to tuhu_prodocts_url, notice: 'Prodoct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuhu_prodoct
      @tuhu_prodoct = Tuhu::Prodoct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuhu_prodoct_params
      params.require(:tuhu_prodoct).permit(:detail_id, :kind_id, :name, :price, :category, :url, :remark)
    end
end
