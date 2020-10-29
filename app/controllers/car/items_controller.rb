class Car::ItemsController < ApplicationController
  before_action :set_car_item, only: [:show, :edit, :update, :destroy]

  def home

  end
  # GET /car/items
  # GET /car/items.json
  def index
    # @car_items = Car::Item.all
    per_page = params[:per_page] || 100
    @q = Car::Item.ransack(params[:q])
    @data = @q.result()
    @car_items = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  def search
    per_page = params[:per_page] || 100
    @q = Car::All_car.ransack(params[:q])
    @data = @q.result()
    @all_car = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /car/items/1
  # GET /car/items/1.json
  def show
  end

  # GET /car/items/new
  def new
    @car_item = Car::Item.new
  end

  # GET /car/items/1/edit
  def edit
  end

  # POST /car/items
  # POST /car/items.json
  def create
    @car_item = Car::Item.new(car_item_params)

    respond_to do |format|
      if @car_item.save
        format.html { redirect_to @car_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @car_item }
      else
        format.html { render :new }
        format.json { render json: @car_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car/items/1
  # PATCH/PUT /car/items/1.json
  def update
    respond_to do |format|
      if @car_item.update(car_item_params)
        format.html { redirect_to @car_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_item }
      else
        format.html { render :edit }
        format.json { render json: @car_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car/items/1
  # DELETE /car/items/1.json
  def destroy
    @car_item.destroy
    respond_to do |format|
      format.html { redirect_to car_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_item
      @car_item = Car::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_item_params
      params.require(:car_item).permit(:serie_id, :code, :name, :url, :is_sale)
    end
end
