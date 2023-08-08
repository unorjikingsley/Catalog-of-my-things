# frozen_string_literal: true

# add_game_handler.rb
require_relative 'handler'

# Handler class for adding a game to the catalog.
class AddGameHandler < Handler
  def handle(catalog)
    puts 'Enter Game Title:'
    title = gets.chomp

    puts 'Enter Multiplayer (true/false):'
    multiplayer = gets.chomp.downcase == 'true'

    puts 'Enter Last Played Date (YYYY-MM-DD):'
    last_played_date = gets.chomp

    game = Game.new(title: title, multiplayer: multiplayer, last_played_at: last_played_date)
    catalog.add_game(game)

    puts 'Game added successfully!'
  end
end
