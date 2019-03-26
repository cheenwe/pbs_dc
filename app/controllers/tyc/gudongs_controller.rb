class Tyc::GudongsController < ApplicationController
  before_action :set_tyc_gudong, only: [:show, :edit, :update, :destroy]

  # GET /tyc/gudongs
  # GET /tyc/gudongs.json
  def index
    @tyc_gudongs = Tyc::Gudong.all
  end

  # GET /tyc/gudongs/1
  # GET /tyc/gudongs/1.json
  def show
  end

  # GET /tyc/gudongs/new
  def new
    @tyc_gudong = Tyc::Gudong.new
  end

  # GET /tyc/gudongs/1/edit
  def edit
  end

  # POST /tyc/gudongs
  # POST /tyc/gudongs.json
  def create
    @tyc_gudong = Tyc::Gudong.new(tyc_gudong_params)

    respond_to do |format|
      if @tyc_gudong.save
        format.html { redirect_to @tyc_gudong, notice: 'Gudong was successfully created.' }
        format.json { render :show, status: :created, location: @tyc_gudong }
      else
        format.html { render :new }
        format.json { render json: @tyc_gudong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tyc/gudongs/1
  # PATCH/PUT /tyc/gudongs/1.json
  def update
    respond_to do |format|
      if @tyc_gudong.update(tyc_gudong_params)
        format.html { redirect_to @tyc_gudong, notice: 'Gudong was successfully updated.' }
        format.json { render :show, status: :ok, location: @tyc_gudong }
      else
        format.html { render :edit }
        format.json { render json: @tyc_gudong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tyc/gudongs/1
  # DELETE /tyc/gudongs/1.json
  def destroy
    @tyc_gudong.destroy
    respond_to do |format|
      format.html { redirect_to tyc_gudongs_url, notice: 'Gudong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tyc_gudong
      @tyc_gudong = Tyc::Gudong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tyc_gudong_params
      params.require(:tyc_gudong).permit(:company_id, :human_id, :invest_rate, :invest_amount)
    end
end
