class ApplicationController < ActionController::Base
  protect_from_forgery

  def process_url
    @video = Video.new(params[:url])
  rescue Exception => e
    render :json => { :message => e.message }
  end
end
