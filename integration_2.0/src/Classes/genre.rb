class Genre
  ##
  # The Genre class represents a genre of items such as books, movies, or music.
  # It provides attributes and methods for managing and organizing items within a specific genre.

  attr_accessor :id, :name, :items

  def initialize(name, id: Random.rand(1..499))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end
end
