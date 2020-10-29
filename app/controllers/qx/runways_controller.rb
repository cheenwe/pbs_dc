class Qx::RunwaysController < ApplicationController
  before_action :set_qx_runway, only: [:show, :edit, :update, :destroy]

  # GET /qx/runways
  # GET /qx/runways.json
  def index
    # @qx_runways = Qx::Runway.all
    
    per_page = params[:per_page] || 100
    @q = Qx::Runway.ransack(params[:q])
    @qx_runways = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /qx/runways/1
  # GET /qx/runways/1.json
  def show
  end

  # GET /qx/runways/new
  def new
    @qx_runway = Qx::Runway.new
  end

  # GET /qx/runways/1/edit
  def edit
  end

  # POST /qx/runways
  # POST /qx/runways.json
  def create
    @qx_runway = Qx::Runway.new(qx_runway_params)

    respond_to do |format|
      if @qx_runway.save
        format.html { redirect_to @qx_runway, notice: 'Runway was successfully created.' }
        format.json { render :show, status: :created, location: @qx_runway }
      else
        format.html { render :new }
        format.json { render json: @qx_runway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qx/runways/1
  # PATCH/PUT /qx/runways/1.json
  def update
    respond_to do |format|
      if @qx_runway.update(qx_runway_params)
        format.html { redirect_to @qx_runway, notice: 'Runway was successfully updated.' }
        format.json { render :show, status: :ok, location: @qx_runway }
      else
        format.html { render :edit }
        format.json { render json: @qx_runway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qx/runways/1
  # DELETE /qx/runways/1.json
  def destroy
    @qx_runway.destroy
    respond_to do |format|
      format.html { redirect_to qx_runways_url, notice: 'Runway was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qx_runway
      @qx_runway = Qx::Runway.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qx_runway_params
      params.require(:qx_runway).permit(:airport_id, :name)
    end
end
