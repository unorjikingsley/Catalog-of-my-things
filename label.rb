class Label
  attr_accessor title, color

  def initialize(title, color)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end

  def list(_all_labels)
    labels = @items.map(&title).uniq
    labels.each do |item|
      print "'#{item.title}', "
    end
  end
end
