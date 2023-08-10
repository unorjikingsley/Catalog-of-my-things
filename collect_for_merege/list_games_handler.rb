# frozen_string_literal: true

require_relative 'handler'
require_relative 'game'

# Handler class for listing all games in the catalog.
class ListGamesHandler < Handler
  def initialize(games)
    @games = games
  end

  def handle
    puts 'List of all games:'
    @games.each_with_index do |game, index|
      puts "#{index + 1}. #{game.title} (Multiplayer: #{game.multiplayer}, Last Played: #{game.last_played_at})"
    end
  end
end
