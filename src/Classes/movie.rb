require_relative 'item'
class Movie < Item
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
