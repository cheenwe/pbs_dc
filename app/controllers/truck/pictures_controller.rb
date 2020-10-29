class Truck::PicturesController < ApplicationController
  before_action :set_truck_picture, only: [:show, :edit, :update, :destroy]

  # GET /truck/pictures
  # GET /truck/pictures.json
  def index
    @truck_pictures = Truck::Picture.all
  end

  # GET /truck/pictures/1
  # GET /truck/pictures/1.json
  def show
  end

  # GET /truck/pictures/new
  def new
    @truck_picture = Truck::Picture.new
  end

  # GET /truck/pictures/1/edit
  def edit
  end

  # POST /truck/pictures
  # POST /truck/pictures.json
  def create
    @truck_picture = Truck::Picture.new(truck_picture_params)

    respond_to do |format|
      if @truck_picture.save
        format.html { redirect_to @truck_picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @truck_picture }
      else
        format.html { render :new }
        format.json { render json: @truck_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck/pictures/1
  # PATCH/PUT /truck/pictures/1.json
  def update
    respond_to do |format|
      if @truck_picture.update(truck_picture_params)
        format.html { redirect_to @truck_picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_picture }
      else
        format.html { render :edit }
        format.json { render json: @truck_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck/pictures/1
  # DELETE /truck/pictures/1.json
  def destroy
    @truck_picture.destroy
    respond_to do |format|
      format.html { redirect_to truck_pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_picture
      @truck_picture = Truck::Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_picture_params
      params.require(:truck_picture).permit(:item_id, :name, :url)
    end
end
