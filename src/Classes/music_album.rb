require_relative 'item'

require 'date'

class MusicAlbum < Item
  ##
  # The MusicAlbum class represents a music album item created by an artist.
  # It inherits from the Item class and provides additional attributes and functionalities specific to music albums.

  attr_accessor :on_spotify

  def initialize(genre, on_spotify, publish_date: Date.today.to_s)
    super(publish_date)
    @on_spotify = on_spotify
    add_genre(genre)
  end

  def can_be_archived?
    super && @on_spotify
  end
end
