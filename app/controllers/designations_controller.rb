class DesignationsController < ApplicationController
  # GET /designations
  # GET /designations.xml
  def index
    @designations = Designation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @designations }
    end
  end

  # GET /designations/1
  # GET /designations/1.xml
  def show
    @designation = Designation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @designation }
    end
  end

  # GET /designations/new
  # GET /designations/new.xml
  def new
    @designation = Designation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @designation }
    end
  end

  # GET /designations/1/edit
  def edit
    @designation = Designation.find(params[:id])
  end

  # POST /designations
  # POST /designations.xml
  def create
    @designation = Designation.new(params[:designation])

    respond_to do |format|
      if @designation.save
        format.html { redirect_to(@designation, :notice => 'Designation was successfully created.') }
        format.xml  { render :xml => @designation, :status => :created, :location => @designation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @designation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /designations/1
  # PUT /designations/1.xml
  def update
    @designation = Designation.find(params[:id])

    respond_to do |format|
      if @designation.update_attributes(params[:designation])
        format.html { redirect_to(@designation, :notice => 'Designation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @designation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /designations/1
  # DELETE /designations/1.xml
  def destroy
    @designation = Designation.find(params[:id])
    @designation.destroy

    respond_to do |format|
      format.html { redirect_to(designations_url) }
      format.xml  { head :ok }
    end
  end
end
