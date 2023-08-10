# frozen_string_literal: true

class Source
  attr_reader :id, :name
  attr_accessor :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
