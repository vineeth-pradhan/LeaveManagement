class AvailableOffsController < ApplicationController
  # GET /available_offs
  # GET /available_offs.xml
  def index
    @employee = Employee.find(params[:employee_id])
    @available_offs = @employee.available_offs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @available_offs }
    end
  end

  # GET /available_offs/1
  # GET /available_offs/1.xml
  def show
    @available_off = AvailableOff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @available_off }
    end
  end

  # GET /available_offs/new
  # GET /available_offs/new.xml
  def new
    @available_off = AvailableOff.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @available_off }
    end
  end

  # GET /available_offs/1/edit
  def edit
    @available_off = AvailableOff.find(params[:id])
  end

  # POST /available_offs
  # POST /available_offs.xml
  def create
    @available_off = AvailableOff.new(params[:available_off])

    respond_to do |format|
      if @available_off.save
        format.html { redirect_to(@available_off, :notice => 'AvailableOff was successfully created.') }
        format.xml  { render :xml => @available_off, :status => :created, :location => @available_off }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @available_off.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /available_offs/1
  # PUT /available_offs/1.xml
  def update
    @available_off = AvailableOff.find(params[:id])

    respond_to do |format|
      if @available_off.update_attributes(params[:available_off])
        format.html { redirect_to(@available_off, :notice => 'AvailableOff was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @available_off.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /available_offs/1
  # DELETE /available_offs/1.xml
  def destroy
    @available_off = AvailableOff.find(params[:id])
    @available_off.destroy

    respond_to do |format|
      format.html { redirect_to(available_offs_url) }
      format.xml  { head :ok }
    end
  end
end
