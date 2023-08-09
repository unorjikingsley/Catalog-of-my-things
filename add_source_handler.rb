require_relative 'handler'
require_relative 'source'

# Handler class for adding a source to the catalog.
class AddSourceHandler < Handler
  def initialize(sources)
    @sources = sources
  end

  def handle
    puts 'Enter Source Name:'
    name = gets.chomp

    id = @sources.empty? ? 1 : @sources.last.id + 1
    source = Source.new(id, name)
    @sources << source

    puts "Source '#{name}' added successfully!"
  end
end
