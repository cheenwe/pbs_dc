<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController

  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy, :clone]
  before_action :check_bulks, only: [:bulks]
  before_action :set_bulk_<%= plural_table_name %>, only: [:bulks, :bulk_destroy, :bulk_update]

  # layout "base", only: [:select]

  # GET /<%= controller_file_path %>
  def index
    <%= plural_table_name %> = <%= class_name %>.order("id desc")
    @q = <%= plural_table_name %>.ransack(params[:q])
    @<%= plural_table_name %> = @q.result().paginate(:page => params[:page], :per_page => params[:per_page], :total_entries =>  <%= class_name %>.total_entries)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: {code: "200", success: 1 , msg: "ok", data: @<%= plural_table_name %>, meta: { total: @<%= plural_table_name %>.total_entries, per_page: per_page, page: page }}}
    end
  end

  # GET /<%= controller_file_path %>/1
  def show

    respond_to do |format|
      format.json { render json: {code: "200",success: 1 ,msg: "ok", data: @<%= singular_table_name %>} }
      format.html { render :show }
    end
  end

  # GET /<%= controller_file_path %>/new
  def new
    @<%= singular_table_name %> = <%= class_name %>.new
  end

  # GET /<%= singular_table_name %>/1/edit
  def edit
  end

  # POST /<%= controller_file_path %>
  def create
    @<%= singular_table_name %> = <%= class_name %>.new(<%= singular_table_name %>_params)
    #@<%= singular_table_name %>.user_id = current_user.id  rescue ''
    #@<%= singular_table_name %>.department_id = current_user.department_id

    respond_to do |format|
      if @<%= singular_table_name %>.save
        @back_url = set_back_url(@<%= singular_table_name %>)
        format.json { render json: {code: "200", success: 1, msg: t('create_success'), data: @<%= singular_table_name %> } }
        format.html { redirect_to @<%= singular_table_name %>, notice: t('create_success')   }
      else
        flash.now[:alert] = @<%= singular_table_name %>.errors.full_messages
        format.html { render :new }
        format.json { render json: { code: "500", success: 0 , msg: @<%= singular_table_name %>.errors.full_messages, data: ""}}
      end
    end
  end

  # PATCH/PUT /<%= singular_table_name %>/1
  def update
    respond_to do |format|
      if @<%= singular_table_name %>.update(<%= singular_table_name %>_params)
        @back_url = set_back_url(@<%= singular_table_name %>)
        format.html { redirect_to @<%= singular_table_name %>, notice: t('update_success')   }
        format.json { render json: { code: "200", success: 1 , msg: "ok", data: @<%= singular_table_name %>}}
      else
        flash.now[:alert] = @<%= singular_table_name %>.errors.full_messages
        format.html { render :edit }
        format.json { render json: { code: "500", success: 0 , msg: @<%= singular_table_name %>.errors.full_messages, data: ""}}
      end
    end
  end

  # DELETE /<%= controller_file_path %>/1
  def destroy
    @<%= singular_table_name %>.destroy
    respond_to do |format|
      format.html { redirect_to "/<%= controller_file_path %>", notice:  t('destroy_success')  }
      format.json { render json: { code: "200", success: 1 , msg: "success", data: ""}}
    end
  end

  # POST /<%= controller_file_path %>/bulk_destroy
  # 批量删除
  def bulk_destroy
    @<%= plural_table_name %>.destroy_all
    size = @<%= singular_table_name %>s.size
    message =  t("bulk_action_success", action: "#{t('destroy')}", size: size)

    respond_to do |format|
      format.json { render json: {code: "200", success: 1, msg: message, data: ""} }
      format.html { redirect_to @back_url, notice: message }
    end
  end

  # POST /<%= controller_file_path %>/bulks
  # 批量操作
  def bulks
    @back_url = params[:back_url].present?? params[:back_url]:"/<%= controller_file_path %>"
    size = @<%= singular_table_name %>s.size
    if params[:bulk_action] == "destroy"
      bulk_destroy
    end
  end

  private
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= class_name %>.find(params[:id])
    end

    def check_bulks
      if request.get?
        redirect_to "/<%= controller_file_path %>", notice: t("select_data_then_bulk")
      end
    end

    def set_bulk_<%= plural_table_name %>
      @<%= plural_table_name %> = <%= class_name %>.where(id: params[:bulk_ids]).order("id desc")
    end

    def <%= singular_table_name %>_params
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    end

    def set_back_url(<%= singular_table_name %>)
      if (params[:next] == 'back' and params[:action] == "create")
        "/<%= controller_file_path %>/new"
      elsif (params[:next] == 'back' and params[:action] == "update")
        "/<%= controller_file_path %>/#{<%= singular_table_name %>.id}/edit"
      elsif params[:next] == 'new'
        "/<%= controller_file_path %>/new"
      elsif params[:next] == 'index'
        "/<%= controller_file_path %>"
      elsif params[:next] == 'clone'
        "/<%= controller_file_path %>/#{<%= singular_table_name %>.id}/clone"
      else
        <%= singular_table_name %>
      end
    end

end

<% end -%>
