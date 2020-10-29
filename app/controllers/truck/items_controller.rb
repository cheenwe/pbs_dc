class Truck::ItemsController < ApplicationController
  before_action :set_truck_item, only: [:show, :edit, :update, :destroy]

  # GET /truck/items
  # GET /truck/items.json
  def index
    @truck_items = Truck::Item.all
  end

  # GET /truck/items/1
  # GET /truck/items/1.json
  def show
  end

  # GET /truck/items/new
  def new
    @truck_item = Truck::Item.new
  end

  # GET /truck/items/1/edit
  def edit
  end

  # POST /truck/items
  # POST /truck/items.json
  def create
    @truck_item = Truck::Item.new(truck_item_params)

    respond_to do |format|
      if @truck_item.save
        format.html { redirect_to @truck_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @truck_item }
      else
        format.html { render :new }
        format.json { render json: @truck_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck/items/1
  # PATCH/PUT /truck/items/1.json
  def update
    respond_to do |format|
      if @truck_item.update(truck_item_params)
        format.html { redirect_to @truck_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_item }
      else
        format.html { render :edit }
        format.json { render json: @truck_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck/items/1
  # DELETE /truck/items/1.json
  def destroy
    @truck_item.destroy
    respond_to do |format|
      format.html { redirect_to truck_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_item
      @truck_item = Truck::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_item_params
      params.require(:truck_item).permit(:serie_id, :code, :name, :url, :is_sale)
    end
end
