class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json

  def process_url
    begin
      @video = Video.new(Rack::Utils.unescape(params[:url]))
      render :json => @video
    rescue Exception => e
      render :json => { :message => e.message }
    end
  end
end
