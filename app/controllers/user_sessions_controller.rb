class UserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy
  layout nil
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      flash[:notice] = "Logged in Successfully."
      redirect_to(:controller=>'generals',:action=>'index')
    else
      flash[:error] = "Invalid Email or Password. "
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "You have successfully logged out."
    redirect_back_or_default new_user_session_url
  end
end
