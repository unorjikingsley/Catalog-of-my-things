class Author
  attr_reader :first_name, :last_name, :items

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end

