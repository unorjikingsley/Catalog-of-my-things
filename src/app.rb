require_relative 'modules/Book/create_book'
require_relative 'modules/Book/display_books'
require_relative 'modules/Genre/display_genres'
require_relative 'modules/MusicAlbum/create_music_album'
require_relative 'modules/MusicAlbum/display_music_albums'
require_relative 'modules/Label/display_labels'
require_relative 'modules/Movies/add_movie'
require_relative 'modules/Movies/list_movie'
require_relative 'modules/Source/list_source'
require_relative 'modules/preserve_data'
require_relative 'modules/load_data'
require_relative 'modules/Author/create_author'
require_relative 'modules/Author/display_author'

class App
  include LoadData
  include PreserveData
  include CreateBook
  include DisplayBooks
  include DisplayLabels
  include DisplayGenres
  include CreateMusicAlbum
  include DisplayMusicAlbums
  include DisplayAuthor
  include AddMovie
  include ListMovie
  include ListSource

  attr_accessor :exit

  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @authors = []
    @games = []
    @movies = []
    @sources = []
    sych
  end

  def sych
    load_data
  end

  OPTIONS = {
    1 => 'List all books', 2 => 'List all music albums', 3 => 'List all movies',
    4 => 'List all games', 5 => 'List all genres', 6 => 'List all labels',
    7 => 'List all authors', 8 => 'List all sources', 9 => 'Add a book',
    10 => 'Add a music album', 11 => 'Add a movie',
    0 => 'Exit'
  }.freeze

  ACTIONS = {
    1 => :display_books, 2 => :display_music_albums, 5 => :display_genres, 3 => :list_movie,
    6 => :display_labels, 8 => :list_source, 9 => :create_book, 10 => :create_music_album,
    7 => :display_author, 4 => :display_game, 11 => :add_movie, 0 => :exit_app
  }.freeze

  def run(option)
    action = ACTIONS[option]
    send(action) if action
  end

  def display_options
    OPTIONS.each { |number, description| puts "#{number}. #{description}" }
  end

  def option?(option)
    OPTIONS.key?(option)
  end

  def exit_app
    preserve_data
    puts 'Thank you for using our app!'
    @exit = true
  end
end
