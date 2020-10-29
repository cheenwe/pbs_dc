class Qx::MessagesController < ApplicationController
  before_action :set_qx_message, only: [:show, :edit, :update, :destroy]

  # GET /qx/messages
  # GET /qx/messages.json
  def index
    # @qx_messages = Qx::Message.all
    
    per_page = params[:per_page] || 100
    @q = Qx::Message.ransack(params[:q])
    @qx_messages = @q.result().paginate(:page => params[:page], :per_page => per_page)
  end

  # GET /qx/messages/1
  # GET /qx/messages/1.json
  def show
  end

  # GET /qx/messages/new
  def new
    @qx_message = Qx::Message.new
  end

  # GET /qx/messages/1/edit
  def edit
  end

  # POST /qx/messages
  # POST /qx/messages.json
  def create
    @qx_message = Qx::Message.new(qx_message_params)

    respond_to do |format|
      if @qx_message.save
        format.html { redirect_to @qx_message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @qx_message }
      else
        format.html { render :new }
        format.json { render json: @qx_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qx/messages/1
  # PATCH/PUT /qx/messages/1.json
  def update
    respond_to do |format|
      if @qx_message.update(qx_message_params)
        format.html { redirect_to @qx_message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @qx_message }
      else
        format.html { render :edit }
        format.json { render json: @qx_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qx/messages/1
  # DELETE /qx/messages/1.json
  def destroy
    @qx_message.destroy
    respond_to do |format|
      format.html { redirect_to qx_messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qx_message
      @qx_message = Qx::Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qx_message_params
      params.require(:qx_message).permit(:airport_id, :content, :hour_tag, :value)
    end
end
