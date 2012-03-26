class DistrictsController < ApplicationController
  before_filter :recent_items
  layout "application", :except => [:show, :edit]

  def index
    @districts = District.search(params[:search]).paginate(:page => page, :per_page => per_page).order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @districts }
    end
  end

  def show
    @district = District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @district }
    end
  end

  def new
    @district = District.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @district }
    end
  end

  def edit
    @district = District.find(params[:id])
  end

  def create
    @district = District.new(params[:district])

    respond_to do |format|
      if @district.save
        format.html { redirect_to(districts_url, :notice => 'District was successfully created.') }
        format.xml  { render :xml => @district, :status => :created, :location => @district }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @district.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @district = District.find(params[:id])

    respond_to do |format|
      if @district.update_attributes(params[:district])
        format.html { redirect_to(@district, :notice => 'District was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @district.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @district = District.find(params[:id])
    @district.destroy

    respond_to do |format|
      format.html { redirect_to(districts_url) }
      format.xml  { head :ok }
    end
  end
  def approve
    @district = District.find(params[:id])
    @district.update_attribute('status', @district.status ? false : true)
    respond_to do |format|
      format.js
    end
  end

  ########################################################
  private
  def recent_items
    @recent = District.recent
  end
end
