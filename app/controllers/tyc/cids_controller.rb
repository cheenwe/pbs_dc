class Tyc::CidsController < ApplicationController
  before_action :set_tyc_cid, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token, :only => [:verify_ok, :cookie]
  # GET /tyc/cids
  # GET /tyc/cids.json
  def index
    # @tyc_cids = Tyc::Cid.all
    @q = Tyc::Cid.ransack(params[:q])
    @tyc_cids = @q.result().paginate(:page => params[:page], :per_page => 100)
    @codes = Rails.cache.read("current_cid_url")

    key = "18979685279_need_verify"
    @tyc_need_verify = $redis.get(key)
    key = "1897968527900_need_verify"
    @tyc_need_verify1 = $redis.get(key)
  end

  # GET /tyc/cids/1
  # GET /tyc/cids/1.json
  def show
  end

  # GET /tyc/cids/new
  def new
    @tyc_cid = Tyc::Cid.new
  end

  # GET /tyc/cids/1/edit
  def edit
  end

  # POST /tyc/cids
  # POST /tyc/cids.json
  def create
    @tyc_cid = Tyc::Cid.new(tyc_cid_params)

    respond_to do |format|
      if @tyc_cid.save
        format.html { redirect_to @tyc_cid, notice: 'Cid was successfully created.' }
        format.json { render :show, status: :created, location: @tyc_cid }
      else
        format.html { render :new }
        format.json { render json: @tyc_cid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tyc/cids/1
  # PATCH/PUT /tyc/cids/1.json
  def update
    respond_to do |format|
      if @tyc_cid.update(tyc_cid_params)
        format.html { redirect_to @tyc_cid, notice: 'Cid was successfully updated.' }
        format.json { render :show, status: :ok, location: @tyc_cid }
      else
        format.html { render :edit }
        format.json { render json: @tyc_cid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tyc/cids/1
  # DELETE /tyc/cids/1.json
  def destroy
    @tyc_cid.destroy
    respond_to do |format|
      format.html { redirect_to tyc_cids_url, notice: 'Cid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #点击验证完成后执行动作
  def verify_ok 
    app = params[:app]

    key = "#{app}-ok" 
    p key
    value = 1

    $redis.set(key, value)
    key = "#{app}_need_verify" 
    value = ""
    $redis.set(key, value)
    respond_to do |format|
      format.html { redirect_to tyc_cids_url, notice: 'Action was successfully.' }
    end
  end

  def cookie 
    if request.post?
      app = params[:tyc_cid][:app]
      cookie = params[:tyc_cid][:cookie]
      key = "#{app}-cookie"
      value = cookie

      $redis.set(key, value) 
      respond_to do |format|
        format.html { redirect_to tyc_cids_url, notice: 'Action was successfully.' }
      end
    elsif request.get?

      app = params[:app] rescue  0
      key = "#{app}-cookie"
      
      @tyc_cookie = $redis.get(key) 

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tyc_cid
      @tyc_cid = Tyc::Cid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tyc_cid_params
      params.require(:tyc_cid).permit(:city_id, :state, :number)
    end
end
