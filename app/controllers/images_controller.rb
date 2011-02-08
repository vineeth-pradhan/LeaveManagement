class ImagesController < ApplicationController
  layout 'application'
  # GET /images
  # GET /images.xml
#  def index
#    @images = Image.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @images }
#    end
#  end

#   GET /images/1
#   GET /images/1.xml
  def show
    @employee=Employee.find(params[:employee_id])
    @image=@employee.image
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @employee=Employee.find(params[:employee_id])
    if @employee.image
      @image=@employee.image
      respond_to do |format|
        format.html {render :action => 'edit', :id => @image}
      end
    else
      @image = Image.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @image }
      end
    end
  end

  # GET /images/1/edit
  def edit
    @employee=Employee.find(params[:id])
    @image=@employee.image
#    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    @employee=Employee.find(params[:employee_id])
    @image=Image.new(params[:image])
    @image.employee=@employee

    respond_to do |format|
      if @image.save
        format.html { redirect_to(image_url(@employee), :notice => 'Image was successfully created.') }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @employee=Employee.find(params[:employee_id])
#    @image = Image.find(params[:id])
    @image=@employee.image

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to(employee_image_url(@employee), :notice => 'Image was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(images_url) }
      format.xml  { head :ok }
    end
  end
end
