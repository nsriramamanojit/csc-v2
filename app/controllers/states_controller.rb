class StatesController < ApplicationController
  before_filter :recent_items
  layout "application", :except => [:show, :edit]
  def index
    @states = State.search(params[:search]).paginate(:page => page, :per_page => per_page).order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @states }
    end
  end

  def show
    @state = State.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @state }
    end
  end

  def new
    @state = State.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @state }
    end
  end

  def edit
    @state = State.find(params[:id])
  end

  def create
    @state = State.new(params[:state])

    respond_to do |format|
      if @state.save
        format.html { redirect_to(states_url, :notice => 'State was successfully created.') }
        format.xml  { render :xml => @state, :status => :created, :location => @state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @state.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @state = State.find(params[:id])

    respond_to do |format|
      if @state.update_attributes(params[:state])
        format.html { redirect_to(@state, :notice => 'State was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @state.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy

    respond_to do |format|
      format.html { redirect_to(states_url) }
      format.xml  { head :ok }
    end
  end
  def approve
    @state = State.find(params[:id])
    @state.update_attribute('status', @state.status ? false : true)
    respond_to do |format|
      format.js
    end
  end

  ########################################################
  private
  def recent_items
    @recent = State.recent
  end
end
