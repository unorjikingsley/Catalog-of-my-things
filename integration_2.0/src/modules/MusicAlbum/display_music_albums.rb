module DisplayMusicAlbums
  def display_music_albums
    puts '----------------------------------------------------'
    if @albums.empty?
      puts 'No music albums yet 🕸 ,please add some albums...'
    else
      @albums.each_with_index do |album, index|
        puts "#{index}) on_spotify:
         '#{album.on_spotify}', Genre: '#{album.genre.name}' Published at: '#{album.publish_date}'"
      end
    end
    puts '----------------------------------------------------'
  end
end
