# This class provides a comprehensive set of functionality and interfaces for the seamless operation of the application.
# It serves as a crucial component that enables the smooth functioning and interaction between various elements within
# the app. By encapsulating essential features and services, this class ensures a streamlined user experience and
# facilitates efficient utilization of the application's capabilities.
# Its purpose is to supply the necessary tools and interfaces that empower users to fully leverage the functionality
# offered by the app.

class App
  attr_accessor :exit

  def menu_options
    { '1' => method(:all_books), '2' => method(:all_music_albums), '3' => method(:all_movies),
      '4' => method(:all_genres), '5' => method(:all_authors), '6' => method(:all_sources),
      '7' => method(:add_book), '8' => method(:add_music_album), '9' => method(:add_movie),
      '10' => method(:add_game), '11' => method(:exit_app?) }
  end

  def display_menu
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all genres'
    puts '5 - List all authors'
    puts '6 - List all sources'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a movie'
    puts '10 - Add a game'
  end

  private

  def all_books
    puts 'all books'
  end

  def all_music_albums
    puts 'all music albums'
  end

  def all_movies
    puts 'all movies'
  end

  def all_genres
    puts 'all generes'
  end

  def all_authors
    puts 'all authors'
  end

  def all_sources
    puts 'all sources'
  end

  def add_book
    puts 'add book'
  end

  def add_music_album
    puts 'add music album'
  end

  def add_movie
    puts 'add movie'
  end

  def add_game
    puts 'add game'
  end

  def exit_app?
    # save all files method call here
    puts 'Cheers!'
    @exit = true
  end
end