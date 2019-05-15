class Note
  attr_reader :title, :body

  def initialize(title = "", body = "")
    @title = title
    @body = body
  end

  def set(title, body)
    @title = title
    @body = body
    return create_message
  end

  private
  def create_message
    return "New note created. Title: #{@title}. Body: #{@body}"
  end


end