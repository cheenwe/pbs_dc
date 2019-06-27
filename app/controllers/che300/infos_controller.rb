class Che300::InfosController < ApplicationController
  before_action :set_che300_info, only: [:show, :edit, :update, :destroy]

  # GET /che300/infos
  # GET /che300/infos.json
  def index
    @che300_infos = Che300::Info.all
  end

  # GET /che300/infos/1
  # GET /che300/infos/1.json
  def show
  end

  # GET /che300/infos/new
  def new
    @che300_info = Che300::Info.new
  end

  # GET /che300/infos/1/edit
  def edit
  end

  # POST /che300/infos
  # POST /che300/infos.json
  def create
    @che300_info = Che300::Info.new(che300_info_params)

    respond_to do |format|
      if @che300_info.save
        format.html { redirect_to @che300_info, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @che300_info }
      else
        format.html { render :new }
        format.json { render json: @che300_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /che300/infos/1
  # PATCH/PUT /che300/infos/1.json
  def update
    respond_to do |format|
      if @che300_info.update(che300_info_params)
        format.html { redirect_to @che300_info, notice: 'Info was successfully updated.' }
        format.json { render :show, status: :ok, location: @che300_info }
      else
        format.html { render :edit }
        format.json { render json: @che300_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /che300/infos/1
  # DELETE /che300/infos/1.json
  def destroy
    @che300_info.destroy
    respond_to do |format|
      format.html { redirect_to che300_infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_che300_info
      @che300_info = Che300::Info.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def che300_info_params
      params.require(:che300_info).permit(:remark)
    end

    def che300
      data = { a: "乘用车", b: "品牌", c: "车系", d: "2018xxxx,34.5w;"}
      Che300::Info.create(
            remark: data
      )
    end
end
