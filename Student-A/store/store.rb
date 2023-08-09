require 'json'
require_relative '../classes/book'
require_relative '../classes/label'

class Store
  attr_accessor :books, :labels, :albums, :genres, :authors, :games, :movies, :sources

  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @authors = []
    @games = []
    @movies = []
    @sources = []
    # synch functions are goes here
    sync_books
  end

  def add_book(book)
    @books << book
  end

  def add_labels(label)
    @labels << label
  end

  def add_albums(album)
    @albums << album
  end

  def add_genres(genre)
    @genres << genre
  end

  def add_author(author)
    @authors << author
  end

  def add_game(game)
    @games << game
  end

  def add_movie(movie)
    @movies << movie
  end

  def add_sources(source)
    @sources << source
  end

  def save_data
    # save data here into json
    save_books
    save_labels
  end

  def save_books
    file_name = 'books.json'
    books_json_data = JSON.generate(books.map(&:to_hash))
    File.write(file_name, books_json_data)
    puts 'books are saved in json'
  end

  def save_labels
    file_name = 'labels.json'
    labels_json_data = JSON.generate(labels.map(&:to_hash))
    File.write(file_name, labels_json_data)
    puts 'lalbels are saved in json'
  end

  def sync_books
    file_name = 'books.json'
    begin
      data = JSON.parse(File.read(file_name))
      books_data = data.map do |book|
        bk = Book.new(Date.parse(book['publish_date']), book['publisher'], book['cover_state'])
        l = Label.new(book['label']['title'], book['label']['color'])
        bk.label = l
        bk
      end
      @books.concat(books_data)
    rescue Errno::ENOENT
      puts 'No books are found! feel free to create books in the choice option'
      []
    end
  rescue JSON::ParserError
    puts 'error in parsing'
    []
  end
end
