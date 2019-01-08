class UidsController < ApplicationController
  before_action :set_uid, only: [:show, :edit, :update, :destroy]

  # GET /uids
  # GET /uids.json
  def index
    @q = Uid.order("id desc").ransack(params[:q])
    @uids = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 30)
  end

  # GET /uids/1
  # GET /uids/1.json
  def show
  end

  # GET /uids/new
  def new
    @uid = Uid.new
  end

  # GET /uids/1/edit
  def edit
  end

  # POST /uids
  # POST /uids.json
  def create
    @uid = Uid.new(uid_params)

    respond_to do |format|
      if @uid.save
        format.html { redirect_to @uid, notice: 'Uid was successfully created.' }
        format.json { render :show, status: :created, location: @uid }
      else
        format.html { render :new }
        format.json { render json: @uid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uids/1
  # PATCH/PUT /uids/1.json
  def update
    respond_to do |format|
      if @uid.update(uid_params)
        format.html { redirect_to @uid, notice: 'Uid was successfully updated.' }
        format.json { render :show, status: :ok, location: @uid }
      else
        format.html { render :edit }
        format.json { render json: @uid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uids/1
  # DELETE /uids/1.json
  def destroy
    @uid.destroy
    respond_to do |format|
      format.html { redirect_to uids_url, notice: 'Uid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uid
      @uid = Uid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uid_params
      params.require(:uid).permit(:number, :remark)
    end
end
