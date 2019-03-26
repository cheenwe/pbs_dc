class Hz::IdcardsController < ApplicationController
  before_action :set_hz_idcard, only: [:show, :edit, :update, :destroy]

  # GET /hz/idcards
  # GET /hz/idcards.json
  def index
    # @hz_idcards = Hz::Idcard.all
    @q = Hz::Idcard.ransack(params[:q])
    @hz_idcards = @q.result().paginate(:page => params[:page], :per_page => 30)
  end

  # GET /hz/idcards/1
  # GET /hz/idcards/1.json
  def show
  end

  # GET /hz/idcards/new
  def new
    @hz_idcard = Hz::Idcard.new
  end

  # GET /hz/idcards/1/edit
  def edit
  end

  # POST /hz/idcards
  # POST /hz/idcards.json
  def create
    @hz_idcard = Hz::Idcard.new(hz_idcard_params)

    respond_to do |format|
      if @hz_idcard.save
        format.html { redirect_to @hz_idcard, notice: 'Idcard was successfully created.' }
        format.json { render :show, status: :created, location: @hz_idcard }
      else
        format.html { render :new }
        format.json { render json: @hz_idcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hz/idcards/1
  # PATCH/PUT /hz/idcards/1.json
  def update
    respond_to do |format|
      if @hz_idcard.update(hz_idcard_params)
        format.html { redirect_to @hz_idcard, notice: 'Idcard was successfully updated.' }
        format.json { render :show, status: :ok, location: @hz_idcard }
      else
        format.html { render :edit }
        format.json { render json: @hz_idcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hz/idcards/1
  # DELETE /hz/idcards/1.json
  def destroy
    @hz_idcard.destroy
    respond_to do |format|
      format.html { redirect_to hz_idcards_url, notice: 'Idcard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hz_idcard
      @hz_idcard = Hz::Idcard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hz_idcard_params
      params.require(:hz_idcard).permit(:name, :sex, :nation, :birthday, :street, :number, :org, :start_at, :end_at)
    end
end
