# frozen_string_literal: true

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(id:, title:, on_spotify:, publish_date:, genre:, label:, source:)
    super(id, genre, nil, label, publish_date)
    @on_spotify = on_spotify
  end

  def to_s
    "Music Album - #{@title}\n" \
      "ID: #{@id}\n" \
      "Genre: #{@genre.name}\n" \
      "Label: #{@label}\n" \
      "Source: #{@source}\n" \
      "Publish Date: #{@publish_date}\n" \
      "On Spotify: #{@on_spotify}\n" \
      "Archived: #{archived?}\n"
  end

  def can_be_archived?
    super && @on_spotify
  end
end
