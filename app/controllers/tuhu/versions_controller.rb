class Tuhu::VersionsController < ApplicationController
  before_action :set_tuhu_version, only: [:show, :edit, :update, :destroy]

  # GET /tuhu/versions
  # GET /tuhu/versions.json
  def index
    # @tuhu_versions = Tuhu::Version.all

    per_page = params[:per_page] || 100
    @q = Tuhu::Version.ransack(params[:q])
    @tuhu_versions = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /tuhu/versions/1
  # GET /tuhu/versions/1.json
  def show
  end

  # GET /tuhu/versions/new
  def new
    @tuhu_version = Tuhu::Version.new
  end

  # GET /tuhu/versions/1/edit
  def edit
  end

  # POST /tuhu/versions
  # POST /tuhu/versions.json
  def create
    @tuhu_version = Tuhu::Version.new(tuhu_version_params)

    respond_to do |format|
      if @tuhu_version.save
        format.html { redirect_to @tuhu_version, notice: 'Version was successfully created.' }
        format.json { render :show, status: :created, location: @tuhu_version }
      else
        format.html { render :new }
        format.json { render json: @tuhu_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuhu/versions/1
  # PATCH/PUT /tuhu/versions/1.json
  def update
    respond_to do |format|
      if @tuhu_version.update(tuhu_version_params)
        format.html { redirect_to @tuhu_version, notice: 'Version was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuhu_version }
      else
        format.html { render :edit }
        format.json { render json: @tuhu_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuhu/versions/1
  # DELETE /tuhu/versions/1.json
  def destroy
    @tuhu_version.destroy
    respond_to do |format|
      format.html { redirect_to tuhu_versions_url, notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuhu_version
      @tuhu_version = Tuhu::Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuhu_version_params
      params.require(:tuhu_version).permit(:brand_id, :name, :abbr, :reamrk)
    end
end
