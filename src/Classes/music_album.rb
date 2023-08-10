require './src/Classes/item'
require 'date'

class MusicAlbum < Item
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
