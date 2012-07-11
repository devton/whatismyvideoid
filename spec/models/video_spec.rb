require 'spec_helper'

describe Video do
  shared_examples_for "video url" do |url, id|
    it "#{url} return the id -> #{id}" do
      video = described_class.new(url)
      video.id.should == id
    end
  end

  context 'with common url' do
    it_behaves_like 'video url', "http://www.youtube.com/watch?v=ugToTCotX0E", "ugToTCotX0E"
    it_behaves_like 'video url', "youtube.com/watch?v=ugToTCotX0E", "ugToTCotX0E"
  end

  context 'with more complex common url' do
    it_behaves_like 'video url', "http://www.youtube.com/watch?NR=1&feature=endscreen&v=ugToTCotX0E", "ugToTCotX0E"
    it_behaves_like 'video url', "youtube.com/watch?NR=1&feature=endscreen&v=ugToTCotX0E", "ugToTCotX0E"
  end

  context 'with embed url' do
    it_behaves_like 'video url', "http://www.youtube.com/embed/ugToTCotX0E", "ugToTCotX0E"
    it_behaves_like 'video url', "youtube.com/embed/ugToTCotX0E", "ugToTCotX0E"
  end

  context 'with object url' do
    it_behaves_like 'video url', "http://www.youtube.com/v/ugToTCotX0E", "ugToTCotX0E"
    it_behaves_like 'video url', "youtube.com/v/ugToTCotX0E", "ugToTCotX0E"
  end

  context 'with short url' do
    it_behaves_like 'video url', "http://youtu.be/ugToTCotX0E", "ugToTCotX0E"
    it_behaves_like 'video url', "youtu.be/ugToTCotX0E", "ugToTCotX0E"
  end

  it "when id isn't present should raise a error" do
    lambda { described_class.new('http://google.com.br') }.should raise_exception
  end
end
