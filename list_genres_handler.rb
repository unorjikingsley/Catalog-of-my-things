# frozen_string_literal: true

require_relative 'handler'

# Handler class for listing all genres in the catalog.
class ListGenresHandler < Handler
  def initialize(genres)
    @genres = genres
  end

  def handle
    puts 'List of all genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
end
