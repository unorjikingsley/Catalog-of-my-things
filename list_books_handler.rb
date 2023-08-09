require_relative 'handler'

# Handler class for listing all books in the catalog.
class ListBooksHandler < Handler
  def initialize(books)
    @books = books
  end

  def handle
    puts 'List of all books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} (Publisher: #{book.publisher}, Published: #{book.publish_date})"
    end
  end
end
