class Truck::ConfigsController < ApplicationController
  before_action :set_truck_config, only: [:show, :edit, :update, :destroy]

  # GET /truck/configs
  # GET /truck/configs.json
  def index
    @truck_configs = Truck::Config.all
  end

  # GET /truck/configs/1
  # GET /truck/configs/1.json
  def show
  end

  # GET /truck/configs/new
  def new
    @truck_config = Truck::Config.new
  end

  # GET /truck/configs/1/edit
  def edit
  end

  # POST /truck/configs
  # POST /truck/configs.json
  def create
    @truck_config = Truck::Config.new(truck_config_params)

    respond_to do |format|
      if @truck_config.save
        format.html { redirect_to @truck_config, notice: 'Config was successfully created.' }
        format.json { render :show, status: :created, location: @truck_config }
      else
        format.html { render :new }
        format.json { render json: @truck_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck/configs/1
  # PATCH/PUT /truck/configs/1.json
  def update
    respond_to do |format|
      if @truck_config.update(truck_config_params)
        format.html { redirect_to @truck_config, notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_config }
      else
        format.html { render :edit }
        format.json { render json: @truck_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck/configs/1
  # DELETE /truck/configs/1.json
  def destroy
    @truck_config.destroy
    respond_to do |format|
      format.html { redirect_to truck_configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_config
      @truck_config = Truck::Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_config_params
      params.require(:truck_config).permit(:name)
    end
end
