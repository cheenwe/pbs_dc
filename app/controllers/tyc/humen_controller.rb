class Tyc::HumenController < ApplicationController
  before_action :set_tyc_human, only: [:show, :edit, :update, :destroy]

  # GET /tyc/humen
  # GET /tyc/humen.json
  def index
    @tyc_humen = Tyc::Human.all
  end

  # GET /tyc/humen/1
  # GET /tyc/humen/1.json
  def show
  end

  # GET /tyc/humen/new
  def new
    @tyc_human = Tyc::Human.new
  end

  # GET /tyc/humen/1/edit
  def edit
  end

  # POST /tyc/humen
  # POST /tyc/humen.json
  def create
    @tyc_human = Tyc::Human.new(tyc_human_params)

    respond_to do |format|
      if @tyc_human.save
        format.html { redirect_to @tyc_human, notice: 'Human was successfully created.' }
        format.json { render :show, status: :created, location: @tyc_human }
      else
        format.html { render :new }
        format.json { render json: @tyc_human.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tyc/humen/1
  # PATCH/PUT /tyc/humen/1.json
  def update
    respond_to do |format|
      if @tyc_human.update(tyc_human_params)
        format.html { redirect_to @tyc_human, notice: 'Human was successfully updated.' }
        format.json { render :show, status: :ok, location: @tyc_human }
      else
        format.html { render :edit }
        format.json { render json: @tyc_human.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tyc/humen/1
  # DELETE /tyc/humen/1.json
  def destroy
    @tyc_human.destroy
    respond_to do |format|
      format.html { redirect_to tyc_humen_url, notice: 'Human was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tyc_human
      @tyc_human = Tyc::Human.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tyc_human_params
      params.require(:tyc_human).permit(:company_id, :name, :code, :job)
    end
end
