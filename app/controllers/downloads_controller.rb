class DownloadsController < ApplicationController
  before_filter :authenticate
  
  USERS = { 'USERNAME' => 'PASSWORD' }
  
  def authenticate
    self.config.secret = "result of rake secret"
    authenticate_or_request_with_http_digest("Download Counter") do |name|
      USERS[name]
    end    
  end
  
  # GET /downloads
  # GET /downloads.xml
  def index
    @downloads = Download.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @downloads }
    end
  end

  # GET /downloads/1
  # GET /downloads/1.xml
  def show
    @download = Download.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @download }
    end
  end

  # GET /downloads/new
  # GET /downloads/new.xml
  def new
    @download = Download.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @download }
    end
  end

  # GET /downloads/1/edit
  def edit
    @download = Download.find(params[:id])
  end

  # POST /downloads
  # POST /downloads.xml
  def create
    @download = Download.new(params[:download])

    respond_to do |format|
      if @download.save
        format.html { redirect_to(@download, :notice => 'Download was successfully created.') }
        format.xml  { render :xml => @download, :status => :created, :location => @download }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @download.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /downloads/1
  # PUT /downloads/1.xml
  def update
    @download = Download.find(params[:id])

    respond_to do |format|
      if @download.update_attributes(params[:download])
        format.html { redirect_to(@download, :notice => 'Download was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @download.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /downloads/1
  # DELETE /downloads/1.xml
  def destroy
    @download = Download.find(params[:id])
    @download.destroy

    respond_to do |format|
      format.html { redirect_to(downloads_url) }
      format.xml  { head :ok }
    end
  end
end
