class ApplicationController < ActionController::Base
  protect_from_forgery
  protected

  def permission_denied
    flash[:error] = "Sorry, You have NO Permission to access the Content."
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to homes_path
  end

  def per_page
    if params[:per_page]
      @per_page = params[:per_page]
    else
      @per_page = 20
    end
  end

  def page
    if params[:page]
      @page = params[:page]
    else
      @page = 1
    end
  end
end
