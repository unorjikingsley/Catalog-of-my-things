# frozen_string_literal: true

require_relative 'handler'
require_relative 'genre'

# Handler class for adding a genre to the catalog.
class AddGenreHandler < Handler
  def initialize(genres)
    @genres = genres
  end

  def handle
    puts 'Enter Genre Name:'
    genre_name = gets.chomp

    genre = Genre.new(name: genre_name)
    @genres << genre

    puts "Genre '#{genre_name}' added successfully!"
  end
end
