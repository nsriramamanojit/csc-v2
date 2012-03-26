class BlocksController < ApplicationController
  before_filter :recent_items
  layout "application", :except => [:show, :edit]

  def index
    @blocks = Block.search(params[:search]).paginate(:page => page, :per_page => per_page).order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blocks }
    end
  end

  def show
    @block = Block.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @block }
    end
  end

  def new
    @block = Block.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @block }
    end
  end

  def edit
    @block = Block.find(params[:id])
  end

  def create
    @block = Block.new(params[:block])

    respond_to do |format|
      if @block.save
        format.html { redirect_to(blocks_url, :notice => 'Block was successfully created.') }
        format.xml  { render :xml => @block, :status => :created, :location => @block }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @block = Block.find(params[:id])

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to(@block, :notice => 'Block was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy

    respond_to do |format|
      format.html { redirect_to(blocks_url) }
      format.xml  { head :ok }
    end
  end
  def approve
    @block = Block.find(params[:id])
    @block.update_attribute('status', @block.status ? false : true)
    respond_to do |format|
      format.js
    end
  end

  ########################################################
  private
  def recent_items
    @recent = Block.recent
  end
end
