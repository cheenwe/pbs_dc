class Dc::PhotosController < ApplicationController
  before_action :set_dc_photo, only: [:show, :edit, :update, :destroy]

  # GET /dc/photos
  # GET /dc/photos.json
  def index
    # @dc_photos = Dc::Photo.all

    @q = Dc::Photo.ransack(params[:q])
    @dc_photos = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 30)
  end

  # GET /dc/photos/1
  # GET /dc/photos/1.json
  def show
  end

  # GET /dc/photos/new
  def new
    @dc_photo = Dc::Photo.new
  end

  # GET /dc/photos/1/edit
  def edit
  end

  # POST /dc/photos
  # POST /dc/photos.json
  def create
    @dc_photo = Dc::Photo.new(dc_photo_params)

    respond_to do |format|
      if @dc_photo.save
        format.html { redirect_to @dc_photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @dc_photo }
      else
        format.html { render :new }
        format.json { render json: @dc_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dc/photos/1
  # PATCH/PUT /dc/photos/1.json
  def update
    respond_to do |format|
      if @dc_photo.update(dc_photo_params)
        format.html { redirect_to @dc_photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @dc_photo }
      else
        format.html { render :edit }
        format.json { render json: @dc_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dc/photos/1
  # DELETE /dc/photos/1.json
  def destroy
    @dc_photo.destroy
    respond_to do |format|
      format.html { redirect_to dc_photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dc_photo
      @dc_photo = Dc::Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dc_photo_params
      params.require(:dc_photo).permit(:user_id, :url)
    end
end
