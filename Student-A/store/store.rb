require 'json'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative './modules/synchronizer'

class Store
  attr_accessor :books, :labels, :albums, :genres, :authors, :games, :movies, :sources

  include DataSynchronizer

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
    sync_labels
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
    begin
      @books.concat(books_data)
    rescue Errno::ENOENT
      puts 'No books are found! feel free to create books in the choice option'
      []
    end
  rescue JSON::ParserError
    puts 'error in parsing'
    []
  end

  def sync_labels
    begin
      @labels.concat(labels_data)
    rescue Errno::ENOENT
      puts 'No books are found! feel free to create books in the choice option'
      []
    end
  rescue JSON::ParserError
    puts 'error in parsing'
    []
  end
end
