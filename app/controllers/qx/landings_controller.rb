class Qx::LandingsController < ApplicationController
  before_action :set_qx_landing, only: [:show, :edit, :update, :destroy]

  # GET /qx/landings
  # GET /qx/landings.json
  def index
    # @qx_landings = Qx::Landing.all
    
    per_page = params[:per_page] || 100
    @q = Qx::Landing.ransack(params[:q])
    @qx_landings = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /qx/landings/1
  # GET /qx/landings/1.json
  def show
  end

  # GET /qx/landings/new
  def new
    @qx_landing = Qx::Landing.new
  end

  # GET /qx/landings/1/edit
  def edit
  end

  # POST /qx/landings
  # POST /qx/landings.json
  def create
    @qx_landing = Qx::Landing.new(qx_landing_params)

    respond_to do |format|
      if @qx_landing.save
        format.html { redirect_to @qx_landing, notice: 'Landing was successfully created.' }
        format.json { render :show, status: :created, location: @qx_landing }
      else
        format.html { render :new }
        format.json { render json: @qx_landing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qx/landings/1
  # PATCH/PUT /qx/landings/1.json
  def update
    respond_to do |format|
      if @qx_landing.update(qx_landing_params)
        format.html { redirect_to @qx_landing, notice: 'Landing was successfully updated.' }
        format.json { render :show, status: :ok, location: @qx_landing }
      else
        format.html { render :edit }
        format.json { render json: @qx_landing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qx/landings/1
  # DELETE /qx/landings/1.json
  def destroy
    @qx_landing.destroy
    respond_to do |format|
      format.html { redirect_to qx_landings_url, notice: 'Landing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qx_landing
      @qx_landing = Qx::Landing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qx_landing_params
      params.require(:qx_landing).permit(:airport_id, :runway, :come_near_type, :come_near_normal, :c_kind)
    end
end
