class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color)
    @id = rand(1..500)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def list_all_labels
    label_titles = @items.map { |item| item.label.title }.uniq
    print label_titles.join(', ')
  end
end
