class Movie < Item
  attr_accessor :silent

  def initialize(id, title, genre, author, label, publish_date, archived = false, silent = false)
    super(id, genre, author, label, publish_date, archived)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end