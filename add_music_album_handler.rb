require_relative 'handler'
require_relative 'music_album'
require_relative 'add_genre_handler'
require_relative 'add_author_handler'
require_relative 'add_label_handler'
require_relative 'add_source_handler'

class AddMusicAlbumHandler < Handler
  def initialize(music_albums, genres, labels, sources)
    @music_albums = music_albums
    @genres = genres
    @labels = labels
    @sources = sources
  end

  def handle
    title = add_music_album_title
    on_spotify = add_on_spotify
    publish_date = add_publish_date
    genre = add_genre
    label = add_label
    source = add_source

    id = @music_albums.empty? ? 1 : @music_albums.last.id + 1
    music_album = MusicAlbum.new(id: id, title: title, on_spotify: on_spotify, publish_date: publish_date, genre: genre, label: label, source: source)
    @music_albums << music_album

    puts "Music Album '#{title}' added successfully!"
  end

  private

  def add_music_album_title
    puts 'Enter Music Album Title:'
    gets.chomp
  end

  def add_on_spotify
    puts 'Is it on Spotify? (true/false):'
    gets.chomp.downcase == 'true'
  end

  def add_publish_date
    puts 'Enter Publish Date (YYYY-MM-DD):'
    gets.chomp
  end

  def add_genre
    AddGenreHandler.new(@genres).handle
  end

  def add_label
    AddLabelHandler.new(@labels).handle
  end

  def add_source
    AddSourceHandler.new(@sources).handle
  end
end
