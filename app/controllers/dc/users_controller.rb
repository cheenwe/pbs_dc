class Dc::UsersController < ApplicationController
  before_action :set_dc_user, only: [:show, :edit, :update, :destroy]

  # GET /dc/users
  # GET /dc/users.json
  def index
    @dc_users_size = 0#Dc::User.all.size

    @q = Dc::User.ransack(params[:q])
    @dc_users = @q.result().paginate(:page => params[:page], :per_page => 30)
  end

  # GET /dc/users/1
  # GET /dc/users/1.json
  def show

    photos = @dc_user.photos
    @photos = photos.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /dc/users/new
  def new
    @dc_user = Dc::User.new
  end

  # GET /dc/users/1/edit
  def edit
  end

  # POST /dc/users
  # POST /dc/users.json
  def create
    @dc_user = Dc::User.new(dc_user_params)

    respond_to do |format|
      if @dc_user.save
        format.html { redirect_to @dc_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @dc_user }
      else
        format.html { render :new }
        format.json { render json: @dc_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dc/users/1
  # PATCH/PUT /dc/users/1.json
  def update
    respond_to do |format|
      if @dc_user.update(dc_user_params)
        format.html { redirect_to @dc_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @dc_user }
      else
        format.html { render :edit }
        format.json { render json: @dc_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dc/users/1
  # DELETE /dc/users/1.json
  def destroy
    @dc_user.destroy
    respond_to do |format|
      format.html { redirect_to dc_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dc_user
      @dc_user = Dc::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dc_user_params
      params.require(:dc_user).permit(:uid, :photo_num, :photo_hash, :sign, :info)
    end
end
