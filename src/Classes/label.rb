class Label
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
