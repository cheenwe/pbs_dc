class Jz::RecordsController < ApplicationController
  before_action :set_jz_record, only: [:show, :edit, :update, :destroy]
  
  def export 
    # start_at = Date.parse(params[:start_at]).beginning_of_day || Date.today.beginning_of_day-3.days
    # end_at = Date.parse(params[:end_at]).end_of_day || Date.today.end_of_day

    # jyjgbh = params[:jyjgbh].split(",") rescue User.all.where("id > ? AND approved=?", 3,true).map(&:name).uniq
    # is_pass = params[:is_pass].split(",")rescue 1

    @data = Jz::Record.today

    file_name = "export-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
    loger_file_name = "#{Rails.root}/public/export/#{file_name}"
        File.open("#{loger_file_name}","w+:utf-8") do |f|
          a = "name, phone, id_card, alipay"
                f.puts a
            @data.each do |single|
              # jyjgbh = single.jyjgbh
              a1 = single.user.name
              a2 = single.user.phone
              a3 = single.user.id_card
              a4 = single.user.alipay
              a =  "#{a1},#{a2},'#{a3},#{a4}"
                f.puts a
            end
          f.close
        end
   render :json => {
     :headcode => 200,
     :message =>" ok",
     file: "http://192.168.50.69:3000/export/#{file_name}",
     },
     :status => 200
  end


  # GET /jz/records
  # GET /jz/records.json
  def index
    # @jz_records = Jz::Record.all

    @q = Jz::Record.ransack(params[:q]) 
    @jz_records = @q.result().paginate(:page => params[:page], :per_page => 20)
  end

  def today
    # Jz::Sx.today
    users = Jz::Sx.today.map{|e|e.user.name} + Jz::Record.today.map{|e|e.user.name}
    
   render :json => {
    :data => users,
    :headcode => 200,
    :message =>" ok",
    },
    :status => 200
  end

  # GET /jz/records/1
  # GET /jz/records/1.json
  def show
  end

  # GET /jz/records/new
  def new
    @jz_record = Jz::Record.new
  end

  # GET /jz/records/1/edit
  def edit
  end

  # POST /jz/records
  # POST /jz/records.json
  def create
    @jz_record = Jz::Record.new(jz_record_params)

    respond_to do |format|
      if @jz_record.save
        format.html { redirect_to @jz_record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @jz_record }
      else
        format.html { render :new }
        format.json { render json: @jz_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jz/records/1
  # PATCH/PUT /jz/records/1.json
  def update
    respond_to do |format|
      if @jz_record.update(jz_record_params)
        format.html { redirect_to @jz_record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @jz_record }
      else
        format.html { render :edit }
        format.json { render json: @jz_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jz/records/1
  # DELETE /jz/records/1.json
  def destroy
    @jz_record.destroy
    respond_to do |format|
      format.html { redirect_to jz_records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jz_record
      @jz_record = Jz::Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jz_record_params
      params.require(:jz_record).permit(:user_id, :enter_at, :is_first, :computer_num, :remark)
    end
end
