# frozen_string_literal: true

# list_games_handler.rb
require_relative 'handler'

# Handler class for listing games in the catalog.
class ListGamesHandler < Handler
  def handle(catalog)
    games = catalog.list_games
    puts 'List of all games:'
    games.each do |game|
      puts "#{game.title} (#{game.last_played_at})"
    end
  end
end
