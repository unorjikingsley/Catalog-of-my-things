class Label
  ##
  # The Label class represents a label or tag that can be assigned to items such as books, movies, or music.
  # It provides attributes and methods for managing and organizing items with a specific label.

  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color, id: rand(1..500))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
