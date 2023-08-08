# This class is supply the App functionality interface.

class App
  attr_accessor :exit
  def menu_options
    {
      '1' => method(:all_books),
      '2' => method(:all_music_albums),
      '3' => method(:all_movies),
      '4' => method(:all_genres),
      '5' => method(:all_authors),
      '6' => method(:all_sources),
      '7' => method(:add_book),
      '8' => method(:add_music_album),
      '9' => method(:add_movie),
      '10' => method(:add_game),
      '11' => method(:exit_app?)
    }
  end

  def display_menu
    puts 'My Catalog Things!'
    puts
    puts 'Welcome to School library App!'
    puts
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all genres'
    puts '5 - List all authors '
    puts '6 - List all sources'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a movie'
    puts '10 - Add a game'
    puts '11 - Exit'
  end

  private

  def all_book
    
  end

  def all_music_albums
    
  end

  def all_movies
    
  end

  def all_genres
    
  end

  def all_authors
    
  end

  def all_sources
    
  end

  def add_book
    
  end

  def add_music_album
    
  end

  def add_movie
    
  end

  def add_game
    
  end

  def exit_app?
    # save all files
    puts 'Cheers'
    @exit = true
  end
end
