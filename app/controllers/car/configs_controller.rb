class Car::ConfigsController < ApplicationController
  before_action :set_car_config, only: [:show, :edit, :update, :destroy]

  # GET /car/configs
  # GET /car/configs.json
  def index
    # @car_configs = Car::Config.all
    per_page = params[:per_page] || 100
    @q = Car::Config.ransack(params[:q])
    @data = @q.result()
    @car_configs = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /car/configs/1
  # GET /car/configs/1.json
  def show
  end

  # GET /car/configs/new
  def new
    @car_config = Car::Config.new
  end

  # GET /car/configs/1/edit
  def edit
  end

  # POST /car/configs
  # POST /car/configs.json
  def create
    @car_config = Car::Config.new(car_config_params)

    respond_to do |format|
      if @car_config.save
        format.html { redirect_to @car_config, notice: 'Config was successfully created.' }
        format.json { render :show, status: :created, location: @car_config }
      else
        format.html { render :new }
        format.json { render json: @car_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car/configs/1
  # PATCH/PUT /car/configs/1.json
  def update
    respond_to do |format|
      if @car_config.update(car_config_params)
        format.html { redirect_to @car_config, notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_config }
      else
        format.html { render :edit }
        format.json { render json: @car_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car/configs/1
  # DELETE /car/configs/1.json
  def destroy
    @car_config.destroy
    respond_to do |format|
      format.html { redirect_to car_configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_config
      @car_config = Car::Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_config_params
      params.require(:car_config).permit(:name)
    end
end
