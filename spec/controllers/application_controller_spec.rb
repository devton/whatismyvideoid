require 'spec_helper'

describe ApplicationController do
  it "with invalid URL" do
    get :process_url, { :url => Rack::Utils.escape('http://www.google.com.br/') }
    ActiveSupport::JSON.decode(response.body)['message'].should == 'ID not found or URL is invalid!'
  end

  it "with valid url" do
    get :process_url, { :url => Rack::Utils.escape('http://www.youtube.com/watch?NR=1&feature=endscreen&v=ugToTCotX0E') }
    ActiveSupport::JSON.decode(response.body)['id'].should == 'ugToTCotX0E'
  end
end
