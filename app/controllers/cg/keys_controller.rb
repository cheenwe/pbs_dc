class Cg::KeysController < ApplicationController
  # layout "simple"

  before_action :set_cg_key, only: [:show, :edit, :update, :destroy]

  # GET /cg/keys
  # GET /cg/keys.json
  def index
    @cg_keys = Cg::Key.all
  end

  # GET /cg/keys/1
  # GET /cg/keys/1.json
  def show
  end

  # GET /cg/keys/new
  def new
    @cg_key = Cg::Key.new
  end

  # GET /cg/keys/1/edit
  def edit
  end

  # POST /cg/keys
  # POST /cg/keys.json
  def create
    @cg_key = Cg::Key.new(cg_key_params)

    respond_to do |format|
      if @cg_key.save
        format.html { redirect_to @cg_key, notice: 'Key was successfully created.' }
        format.json { render :show, status: :created, location: @cg_key }
      else
        format.html { render :new }
        format.json { render json: @cg_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cg/keys/1
  # PATCH/PUT /cg/keys/1.json
  def update
    respond_to do |format|
      if @cg_key.update(cg_key_params)
        format.html { redirect_to @cg_key, notice: 'Key was successfully updated.' }
        format.json { render :show, status: :ok, location: @cg_key }
      else
        format.html { render :edit }
        format.json { render json: @cg_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cg/keys/1
  # DELETE /cg/keys/1.json
  def destroy
    @cg_key.destroy
    respond_to do |format|
      format.html { redirect_to cg_keys_url, notice: 'Key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cg_key
      @cg_key = Cg::Key.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cg_key_params
      params.require(:cg_key).permit(:name, :remark)
    end
end
