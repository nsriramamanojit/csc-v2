class UsersController < ApplicationController
  layout "application", :except => [:show, :edit]
  before_filter :require_user, :recent_items

  def index
    @users = User.search(params[:search]).paginate(:page => page, :per_page => per_page)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new
    @user.build_user_profile

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    #vle code and email id generation
    district =District.find(@user.user_profile.district_id)
    district.increment!(:dis_number)
    vle_code= "BR" + district.short_code+"%04d" % district.dis_number
    @user.user_profile.vle_code= vle_code
    @user.email = @user.password = vle_code.downcase.to_s + "@vedavaagcsc.in"
    ############################################################

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  def load_divisions
    @load_divisions = Division.where(:state_id => (params[:id]) ).order("name ASC")
    respond_to do |format|
      format.js
    end
  end
  def load_districts
    @load_districts = District.where(:division_id => params[:id]).order("name ASC")
    respond_to do |format|
      format.js
    end
  end
  def load_blocks
    @load_blocks = Block.where(:district_id => (params[:id])).order("name ASC")
    respond_to do |format|
      format.js
    end

  end
  def load_panchayats
    @load_panchayats = Panchayat.where(:block_id => (params[:id])).order("name ASC")
    respond_to do |format|
      format.js
    end
  end
  def approve
    @user = User.find(params[:id])
    @user.update_attribute('status', @user.status ? false : true)
    respond_to do |format|
      format.js
    end

  end
  ###################################################
  private
  def recent_items
    @recent = User.recent
  end


end
