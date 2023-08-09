
require_relative 'add_genre_handler'
require_relative 'add_author_handler'
require_relative 'add_label_handler'
require_relative 'add_source_handler'
require_relative 'book'


# Handler class for adding a book to the catalog.
class AddBookHandler < Handler
  def initialize(books, genres, authors, labels, sources)
    @books = books
    @genres = genres
    @authors = authors
    @labels = labels
    @sources = sources
  end

  def handle
    title = add_book_title
    genre = add_genre
    author = add_author
    label = add_label
    source = add_source
    publish_date = add_publish_date

    id = @books.empty? ? 1 : @books.last.id + 1
    book = Book.new(id, title, genre, author, label, source, publish_date)
    @books << book

    puts "Book '#{title}' added successfully!"
  end

  private

  def add_book_title
    puts 'Enter Book Title:'
    gets.chomp
  end

  def add_genre
    AddGenreHandler.new(@genres).handle
  end

  def add_author
    AddAuthorHandler.new(@authors).handle
  end

  def add_label
    AddLabelHandler.new(@labels).handle
  end

  def add_source
    AddSourceHandler.new(@sources).handle
  end

  def add_publish_date
    puts 'Enter Publish Date (YYYY-MM-DD):'
    gets.chomp
  end
end

