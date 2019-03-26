class Hz::BanksController < ApplicationController
  before_action :set_hz_bank, only: [:show, :edit, :update, :destroy]

  # GET /hz/banks
  # GET /hz/banks.json
  def index
    # @hz_banks = Hz::Bank.all

    @q = Hz::Bank.ransack(params[:q])
    @hz_banks = @q.result().paginate(:page => params[:page], :per_page => 50)
  end

  # GET /hz/banks/1
  # GET /hz/banks/1.json
  def show
  end

  # GET /hz/banks/new
  def new
    @hz_bank = Hz::Bank.new
  end

  # GET /hz/banks/1/edit
  def edit
  end

  # POST /hz/banks
  # POST /hz/banks.json
  def create
    @hz_bank = Hz::Bank.new(hz_bank_params)

    respond_to do |format|
      if @hz_bank.save
        format.html { redirect_to @hz_bank, notice: 'Bank was successfully created.' }
        format.json { render :show, status: :created, location: @hz_bank }
      else
        format.html { render :new }
        format.json { render json: @hz_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hz/banks/1
  # PATCH/PUT /hz/banks/1.json
  def update
    respond_to do |format|
      if @hz_bank.update(hz_bank_params)
        format.html { redirect_to @hz_bank, notice: 'Bank was successfully updated.' }
        format.json { render :show, status: :ok, location: @hz_bank }
      else
        format.html { render :edit }
        format.json { render json: @hz_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hz/banks/1
  # DELETE /hz/banks/1.json
  def destroy
    @hz_bank.destroy
    respond_to do |format|
      format.html { redirect_to hz_banks_url, notice: 'Bank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hz_bank
      @hz_bank = Hz::Bank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hz_bank_params
      params.require(:hz_bank).permit(:cn_date_year, :cn_date_month, :cn_date_day, :company, :card_number_1, :bank, :xingming, :card_number_2, :bank_branch, :cn_money, :en_money, :cn_date, :protocol_number, :bank_number, :address, :xingming_2, :en_date_year, :en_date_month, :en_date_day, :phone)
    end
end
