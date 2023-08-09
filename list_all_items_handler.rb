require_relative 'handler'

# Handler class for listing all items in the catalog.
class ListAllItemsHandler < Handler
  def initialize(items)
    @items = items
  end

  def handle
    puts 'List of all items:'
    @items.each_with_index do |item, index|
      puts "#{index + 1}. #{item.title} (Type: #{item.class.name}, Published: #{item.publish_date})"
    end
  end
end
