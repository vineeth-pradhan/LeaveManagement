class AppliedOffsController < ApplicationController
  layout 'application'
  # GET /applied_offs
  # GET /applied_offs.xml
  def index
    @employee = current_employee
    @applied_offs = AppliedOff.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applied_offs }
    end
  end

  # GET /applied_offs/1
  # GET /applied_offs/1.xml
  def show
    @employee = current_employee
    @applied_off = AppliedOff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @applied_off }
    end
  end

  # GET /applied_offs/new
  # GET /applied_offs/new.xml
  def new
    @employee = current_employee
    @applied_off = current_employee.applied_offs.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @applied_off }
    end
  end

  # GET /applied_offs/1/edit
  def edit
    @employee = current_employee
    @applied_off = AppliedOff.find(params[:id])
  end

  # POST /applied_offs
  # POST /applied_offs.xml
  def create
    params[:applied_off][:status] = "pending"
    @applied_off = current_employee.applied_offs.build(params[:applied_off])
    respond_to do |format|
      if @applied_off.save
        format.html { redirect_to(employee_applied_off_url(@applied_off.employee,@applied_off), :notice => 'AppliedOff was successfully created.') }
        format.xml  { render :xml => employee_applied_off(@applied_off), :status => :created, :location => @applied_off }
        format.js
      else
        #raise 'here'
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
  
  def update_status
    @applied_off = AppliedOff.find(params[:id])
    if params[:commit] == 'Approve'
      @applied_off.approve
    elsif params[:commit] == 'Reject'
      @applied_off.reject
    end
    respond_to do |format|
      format.html {redirect_to(:controller => 'site', :action => 'site')}
      format.js
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
