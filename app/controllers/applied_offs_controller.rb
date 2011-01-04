class AppliedOffsController < ApplicationController
  # GET /applied_offs
  # GET /applied_offs.xml
  def index
    @applied_offs = AppliedOff.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applied_offs }
    end
  end

  # GET /applied_offs/1
  # GET /applied_offs/1.xml
  def show
    @applied_off = AppliedOff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @applied_off }
    end
  end

  # GET /applied_offs/new
  # GET /applied_offs/new.xml
  def new
    @applied_off = AppliedOff.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @applied_off }
    end
  end

  # GET /applied_offs/1/edit
  def edit
    @applied_off = AppliedOff.find(params[:id])
  end

  # POST /applied_offs
  # POST /applied_offs.xml
  def create
    @applied_off = AppliedOff.new(params[:applied_off])

    respond_to do |format|
      if @applied_off.save
        format.html { redirect_to(@applied_off, :notice => 'AppliedOff was successfully created.') }
        format.xml  { render :xml => @applied_off, :status => :created, :location => @applied_off }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @applied_off.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /applied_offs/1
  # PUT /applied_offs/1.xml
  def update
    @applied_off = AppliedOff.find(params[:id])

    respond_to do |format|
      if @applied_off.update_attributes(params[:applied_off])
        format.html { redirect_to(@applied_off, :notice => 'AppliedOff was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @applied_off.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /applied_offs/1
  # DELETE /applied_offs/1.xml
  def destroy
    @applied_off = AppliedOff.find(params[:id])
    @applied_off.destroy

    respond_to do |format|
      format.html { redirect_to(applied_offs_url) }
      format.xml  { head :ok }
    end
  end
end
