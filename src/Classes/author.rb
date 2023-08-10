class Author
  attr_accessor :name, :first_name, :last_name

  def initialize(name, first_name, last_name)
    @id = Random.rand(1..100)
    @name = name
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end
end
