require_relative 'handler'

# Handler class for listing all labels in the catalog.
class ListLabelsHandler < Handler
  def initialize(labels)
    @labels = labels
  end

  def handle
    puts 'List of all labels:'
    @labels.each_with_index do |label, index|
      puts "#{index + 1}. #{label.title} (Color: #{label.color})"
    end
  end
end
