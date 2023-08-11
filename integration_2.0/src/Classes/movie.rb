require_relative 'item'
class Movie < Item
  ##
  # The Movie class represents a movie item created by an author.
  # It inherits from the Item class and provides additional attributes and functionalities specific to movies.

  attr_reader :id
  attr_accessor :publish_date, :silent

  def initialize(source, publish_date, silent)
    super(publish_date)
    @id = Random.rand(1...1000)
    @silent = silent
    add_source(source)
  end

  def can_be_archived?
    super || @silent == true
  end
end
