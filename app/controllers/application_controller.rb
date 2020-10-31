class ApplicationController < ActionController::Base

  protected

  def page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || WillPaginate.per_page
  end

end
