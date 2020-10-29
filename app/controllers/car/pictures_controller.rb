class Car::PicturesController < ApplicationController
  before_action :set_car_picture, only: [:show, :edit, :update, :destroy]

  # GET /car/pictures
  # GET /car/pictures.json
  def index
    # @car_pictures = Car::Picture.all
    per_page = params[:per_page] || 100
    @q = Car::Picture.ransack(params[:q])
    @data = @q.result()
    @car_pictures = @data.paginate(:page => params[:page], :per_page => per_page)
  end

  def search


    per_page = params[:per_page] || 100
    @q = Car::Image.ransack(params[:q])
    @data = @q.result()
    @car_pictures = @data.paginate(:page => params[:page], :per_page => per_page)

    # per_page = params[:per_page] || 100
    # @q = eval(params[:c]).ransack(params[:q])
    # @car_params = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])
  end

  # GET /car/pictures/1
  # GET /car/pictures/1.json
  def show
  end

  # GET /car/pictures/new
  def new
    @car_picture = Car::Picture.new
  end

  # GET /car/pictures/1/edit
  def edit
  end

  # POST /car/pictures
  # POST /car/pictures.json
  def create
    @car_picture = Car::Picture.new(car_picture_params)

    respond_to do |format|
      if @car_picture.save
        format.html { redirect_to @car_picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @car_picture }
      else
        format.html { render :new }
        format.json { render json: @car_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car/pictures/1
  # PATCH/PUT /car/pictures/1.json
  def update
    respond_to do |format|
      if @car_picture.update(car_picture_params)
        format.html { redirect_to @car_picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_picture }
      else
        format.html { render :edit }
        format.json { render json: @car_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car/pictures/1
  # DELETE /car/pictures/1.json
  def destroy
    @car_picture.destroy
    respond_to do |format|
      format.html { redirect_to car_pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_picture
      @car_picture = Car::Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_picture_params
      params.require(:car_picture).permit(:item_id, :name, :url)
    end
end
