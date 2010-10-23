class HomeController < ApplicationController
  def index
    if params[:path]
      @download = Download.where(["path = ?", params[:path]]).first
      if @download
        @download.update_attribute(:download_count, @download[:download_count] + 1)
        #redirect_to @download[:original_url], :content_type => "application/octet-stream"
      end
    else
      redirect_to "http://excid3.com"
    end
  end
end
