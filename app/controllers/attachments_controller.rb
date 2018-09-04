class AttachmentsController <  ActionController::Base
  # Prevent CSRF attacks by raising an exception.

  protect_from_forgery with: :null_session

  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.with_eager_loaded_images.all
    render json: @attachments
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    # @attachment.image.attach(params[:image])
    respond_to do |format|
      if @attachment.save!
        format.html { redirect_to @attachment, notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.permit(:image, :attachments)
    end
end
