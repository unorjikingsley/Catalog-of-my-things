# frozen_string_literal: true

require_relative 'handler'

# Handler class for listing all music albums in the catalog.
class ListMusicAlbumsHandler < Handler
  def initialize(music_albums)
    @music_albums = music_albums
  end

  def handle
    puts 'List of all music albums:'
    @music_albums.each_with_index do |album, index|
      puts "#{index + 1}. #{album.title} (On Spotify: #{album.on_spotify ? 'Yes' : 'No'}, Published: #{album.publish_date})"
    end
  end
end
