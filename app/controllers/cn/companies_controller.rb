class Cn::CompaniesController < ApplicationController
  before_action :set_cn_company, only: [:show, :edit, :update, :destroy]

  # GET /cn/companies
  # GET /cn/companies.json
  def index
    #@cn_companies = Cn::Company.all

    @q = Cn::Company.ransack(params[:q])
    @cn_companies = @q.result().paginate(:page => params[:page], :per_page => 20, :total_entries => Cn::Company.total_entries)
  end

  # GET /cn/companies/1
  # GET /cn/companies/1.json
  def show
  end

  # GET /cn/companies/new
  def new
    @cn_company = Cn::Company.new
  end

  # GET /cn/companies/1/edit
  def edit
  end

  # POST /cn/companies
  # POST /cn/companies.json
  def create
    @cn_company = Cn::Company.new(cn_company_params)

    respond_to do |format|
      if @cn_company.save
        format.html { redirect_to @cn_company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @cn_company }
      else
        format.html { render :new }
        format.json { render json: @cn_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cn/companies/1
  # PATCH/PUT /cn/companies/1.json
  def update
    respond_to do |format|
      if @cn_company.update(cn_company_params)
        format.html { redirect_to @cn_company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @cn_company }
      else
        format.html { render :edit }
        format.json { render json: @cn_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cn/companies/1
  # DELETE /cn/companies/1.json
  def destroy
    @cn_company.destroy
    respond_to do |format|
      format.html { redirect_to cn_companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cn_company
      @cn_company = Cn::Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cn_company_params
      params.require(:cn_company).permit(:name, :code, :regdate, :c_type, :boss, :capital, :business_scope, :province, :city, :address)
    end
end
