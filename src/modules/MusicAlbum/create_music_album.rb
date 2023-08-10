require_relative '../../Classes/genre'
require_relative '../../Classes/music_album'

module CreateMusicAlbum
  def create_music_album
    print 'Is it on spotify(Y/N)? '
    on_spotify = gets.chomp.downcase == 'y'
    print 'Published date (yyyy-mm-dd): '
    published_date = gets.chomp

    puts 'Give it a genre:'
    print 'Name: '
    genre_name = gets.chomp

    genre = Genre.new(genre_name)

    music = MusicAlbum.new(genre, on_spotify, publish_date: published_date)
    genre.add_item(music)

    @genres << genre
    @albums << music
  end
end
