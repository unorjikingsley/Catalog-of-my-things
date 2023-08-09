require_relative 'handler'
require_relative 'list_genres_handler'
require_relative 'list_authors_handler'
require_relative 'list_labels_handler'
require_relative 'list_sources_handler'
require_relative 'list_all_items_handler'
require_relative 'list_books_handler'
require_relative 'list_music_albums_handler'
require_relative 'list_movies_handler'
require_relative 'list_games_handler'
require_relative 'add_book_handler'
require_relative 'add_music_album_handler'
require_relative 'add_movie_handler'
require_relative 'add_game_handler'
require_relative 'item'
require_relative 'book'
require_relative 'music_album'
require_relative 'movie'
require_relative 'game'
require_relative 'source'
require_relative 'author'
require_relative 'label'
require_relative 'genre'

class App
  def initialize
    @genres = []
    @authors = []
    @labels = []
    @sources = []
    @items = []
    @books = []
    @music_albums = []
    @movies = []
    @games = []

    @handlers = {
      '1' => ListGenresHandler.new(@genres),
      '2' => ListAuthorsHandler.new(@authors),
      '3' => ListLabelsHandler.new(@labels),
      '4' => ListSourcesHandler.new(@sources),
      '5' => ListAllItemsHandler.new(@items),
      '6' => ListBooksHandler.new(@books),
      '7' => ListMusicAlbumsHandler.new(@music_albums),
      '8' => ListMoviesHandler.new(@movies),
      '9' => ListGamesHandler.new(@games),
      '10' => AddBookHandler.new(@books, @genres, @authors, @labels, @sources),
      '11' => AddMusicAlbumHandler.new(@music_albums, @genres, @labels, @sources),
      '12' => AddMovieHandler.new(@movies, @genres, @labels, @sources),
      '13' => AddGameHandler.new(@games),
      '14' => method(:quit) 
    }
  end

  def run
    loop do
      show_menu
      choice = gets.chomp
      handler = @handlers[choice]
      if handler.respond_to?(:call)
        handler.call
      elsif handler
        handler.handle
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def show_menu
    puts "Welcome to Catalog of My Things!"
    puts "1. List all genres"
    puts "2. List all authors"
    puts "3. List all labels"
    puts "4. List all sources"
    puts "5. List all items"
    puts "6. List all books"
    puts "7. List all music albums"
    puts "8. List all movies"
    puts "9. List all games"
    puts "10. Add a book"
    puts "11. Add a music album"
    puts "12. Add a movie"
    puts "13. Add a game"
    puts "14. Quit"
    print "Please choose an option: "
  end

  def quit
    puts "Exiting Catalog of My Things. Goodbye!"
    exit
  end
end


