class Tuhu::DetailsController < ApplicationController
  before_action :set_tuhu_detail, only: [:show, :edit, :update, :destroy]

  # GET /tuhu/details
  # GET /tuhu/details.json
  def index
    # @tuhu_details = Tuhu::Detail.all

    per_page = params[:per_page] || 100
    @q = Tuhu::Detail.ransack(params[:q])
    @tuhu_details = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /tuhu/details/1
  # GET /tuhu/details/1.json
  def show
  end

  # GET /tuhu/details/new
  def new
    @tuhu_detail = Tuhu::Detail.new
  end

  # GET /tuhu/details/1/edit
  def edit
  end

  # POST /tuhu/details
  # POST /tuhu/details.json
  def create
    @tuhu_detail = Tuhu::Detail.new(tuhu_detail_params)

    respond_to do |format|
      if @tuhu_detail.save
        format.html { redirect_to @tuhu_detail, notice: 'Detail was successfully created.' }
        format.json { render :show, status: :created, location: @tuhu_detail }
      else
        format.html { render :new }
        format.json { render json: @tuhu_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuhu/details/1
  # PATCH/PUT /tuhu/details/1.json
  def update
    respond_to do |format|
      if @tuhu_detail.update(tuhu_detail_params)
        format.html { redirect_to @tuhu_detail, notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuhu_detail }
      else
        format.html { render :edit }
        format.json { render json: @tuhu_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuhu/details/1
  # DELETE /tuhu/details/1.json
  def destroy
    @tuhu_detail.destroy
    respond_to do |format|
      format.html { redirect_to tuhu_details_url, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuhu_detail
      @tuhu_detail = Tuhu::Detail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuhu_detail_params
      params.require(:tuhu_detail).permit(:version_id, :url, :remark)
    end
end
