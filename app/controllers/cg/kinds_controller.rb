class Cg::KindsController < ApplicationController
  before_action :set_cg_kind, only: [:show, :edit, :update, :destroy]

  # GET /cg/kinds
  # GET /cg/kinds.json
  def index
    @cg_not_kinds = Cg::Kind.where(is_show:false)
    @cg_select_kinds = Cg::Kind.where(is_show:true)
    @cg_nil_kinds = Cg::Kind.where(is_show:nil)
  end

  def list

    if request.get?
      if params[:is_show] == "true"
        data = Cg::Kind.where(is_show:true)
      elsif  params[:is_show] == "false"
        data= Cg::Kind.where(is_show:false).map{|e|e.false_info}
      elsif  params[:is_show] == "nil"
        data= Cg::Kind.where(is_show:nil)
      end
      render json: {data: data, meta: { errors: nil }}
    else
      if params[:is_show] == "true"
        data = Cg::Kind.where(id: params[:ids]).update_all(is_show:true)
      elsif  params[:is_show] == "false"
        data = Cg::Kind.where(id: params[:ids]).update_all(is_show:false)
      elsif  params[:is_show] == "nil"
        data = Cg::Kind.where(id: params[:ids]).update_all(is_show:nil)
      end

      render json: {data: "success", meta: { errors: nil }}
    end
  end

  # GET /cg/kinds/1
  # GET /cg/kinds/1.json
  def show
  end

  # GET /cg/kinds/new
  def new
    @cg_kind = Cg::Kind.new
  end

  # GET /cg/kinds/1/edit
  def edit
  end

  # POST /cg/kinds
  # POST /cg/kinds.json
  def create
    if params[:data].present?
      # kind_ids = params[:data].keys

      # Cg::Kind.update_all(is_show: false)
      # # kind_ids.each do |id|
      # #   if  params[:data]["#{id}"] == "on"
      # #     Cg::Kind.where(id:id).update_all(is_show:true)
      # #   elsif params[:data]["#{id}"] == false
      # #     Cg::Kind.where(id:id).update_all(is_show:true)
      # #   end
      # # end
      # Cg::Kind.where(id: kind_ids).update_all(is_show:true)

      # respond_to do |format|
      #   format.html { redirect_to cg_kinds_url, notice: 'Kind was successfully destroyed.' }
      #   format.json { head :no_content }
      # end
    else
      @cg_kind = Cg::Kind.new(cg_kind_params)

      respond_to do |format|
        if @cg_kind.save
          format.html { redirect_to @cg_kind, notice: 'Kind was successfully created.' }
          format.json { render :show, status: :created, location: @cg_kind }
        else
          format.html { render :new }
          format.json { render json: @cg_kind.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /cg/kinds/1
  # PATCH/PUT /cg/kinds/1.json
  def update
    if params[:is_show]=="-1" || params[:is_show]=="0"
      is_show = nil if params[:is_show]=="-1"
      is_show = false if params[:is_show]=="0"
      # is_show = false if params[:is_show]=="0"
      @cg_kind.update(is_show:is_show)
      respond_to do |format|
        format.html { redirect_to cg_kinds_url, notice: 'Kind was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        if @cg_kind.update(cg_kind_params)
          format.html { redirect_to @cg_kind, notice: 'Kind was successfully updated.' }
          format.json { render :show, status: :ok, location: @cg_kind }
        else
          format.html { render :edit }
          format.json { render json: @cg_kind.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /cg/kinds/1
  # DELETE /cg/kinds/1.json
  def destroy
    @cg_kind.destroy
    respond_to do |format|
      format.html { redirect_to cg_kinds_url, notice: 'Kind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cg_kind
      @cg_kind = Cg::Kind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cg_kind_params
      params.require(:cg_kind).permit(:name, :is_show)
    end
end
