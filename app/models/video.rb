class Youtube
  attr_accessor :id

  def initialize(url)

    case url
    when /youtube.com.*(?:\/|v=)([\w\-\_]+)/ then @id = $1
    when /youtu.be.*(?:\/|v=)([\w\-\_]+)/ then @id = $1
    end

    self
  end
end
