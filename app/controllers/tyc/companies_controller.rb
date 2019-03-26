class Tyc::CompaniesController < ApplicationController
  before_action :set_tyc_company, only: [:show, :edit, :update, :destroy]

  # GET /tyc/companies
  # GET /tyc/companies.json
  def index
    @tyc_companies = Tyc::Company.all

    @q = Tyc::Company.ransack(params[:q])
    @tyc_companies = @q.result().paginate(:page => params[:page], :per_page => 20)
  end

  # GET /tyc/companies/1
  # GET /tyc/companies/1.json
  def show
  end

  # GET /tyc/companies/new
  def new
    @tyc_company = Tyc::Company.new
  end

  # GET /tyc/companies/1/edit
  def edit
  end

  # POST /tyc/companies
  # POST /tyc/companies.json
  def create
    @tyc_company = Tyc::Company.new(tyc_company_params)

    respond_to do |format|
      if @tyc_company.save
        format.html { redirect_to @tyc_company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @tyc_company }
      else
        format.html { render :new }
        format.json { render json: @tyc_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tyc/companies/1
  # PATCH/PUT /tyc/companies/1.json
  def update
    respond_to do |format|
      if @tyc_company.update(tyc_company_params)
        format.html { redirect_to @tyc_company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @tyc_company }
      else
        format.html { render :edit }
        format.json { render json: @tyc_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tyc/companies/1
  # DELETE /tyc/companies/1.json
  def destroy
    @tyc_company.destroy
    respond_to do |format|
      format.html { redirect_to tyc_companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tyc_company
      @tyc_company = Tyc::Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tyc_company_params
      params.require(:tyc_company).permit(:code, :logo, :name, :old_name, :phone, :mail, :url, :address, :intro, :update_date, :boss_name, :reg_money, :set_date, :status, :reg_number, :credit_code, :company_code, :tax_code, :category_id, :end_time, :industry_id, :tax, :allow_time, :pay_money, :all_people, :insured_people, :organ, :reg_address, :en_name, :operate_scope)
    end
end
