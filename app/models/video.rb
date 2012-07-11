class Video
  attr_accessor :id, :error_message

  def initialize(url)

    case url
    when /youtube.com.*(?:\/|v=)([\w\-\_]+)/ then @id = $1
    when /youtu.be.*(?:\/|v=)([\w\-\_]+)/ then @id = $1
    end

    unless @id.present?
      raise 'ID not found or URL is invalid!'
    end

    self
  end
end
