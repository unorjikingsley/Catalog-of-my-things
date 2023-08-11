require_relative 'item'

class Source
  ##
  # The Source class represents a source from which items such as movies, books, or music can originate.
  # It provides attributes and methods for managing and organizing items associated with a specific source.

  attr_reader :id
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self
  end
end
