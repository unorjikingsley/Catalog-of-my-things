require_relative 'classes/music/music_album'
require_relative 'classes/music/genre'
require_relative 'modules/music/addmusic'
require_relative 'modules/music/displaymusic'
require_relative 'modules/music/displaygenre'
require_relative 'modules/music/storage'

# require_relative 'classes/movie/movie'
# require_relative 'classes/movie/source'
# require_relative 'modules/movie/addmovie'
# require_relative 'modules/music/displaymovie'
# require_relative 'modules/movies/displaysource'
# require_relative 'modules/movies/storage_movies'

class App
  attr_accessor :music_albums

  include AddMusic
  include DisplayMusic
  include DisplayGenres
  include Storage

  # include AddMovie
  # include DisplayMovie
  # include displaysource
  # include StorageMovie

  def initialize
    @music_albums = []
    @genres = []
    @movies = []
    @sources = []
    load_genres
    load_music_albums
    # load_sources
    # load_movies
  end

  def run(option)
    case option
    when 1
      display_all_music_albums
    when 2
      display_all_genres
    when 3
      add_music
    when 4
      puts 'Thank you for using this app!'
      save_music
    else
      puts 'Thank you for using this app!'
      save_music
      exit
    end
  end
end
