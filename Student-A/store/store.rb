require 'json'

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
    save_book
  end

  def save_book
    file_name = 'books.json'
    books_json_data = JSON.generate(books.map(&:to_hash))
    File.write(file_name, books_json_data)
    puts 'books are saved in json'
  end
end
