require_relative 'handler'
require_relative 'game'

# Handler class for adding a game to the catalog.
class AddGameHandler < Handler
  def initialize(games)
    @games = games
  end

  def handle
    puts 'Enter Game Title:'
    title = gets.chomp

    puts 'Enter Multiplayer (true/false):'
    multiplayer = gets.chomp.downcase == 'true'

    puts 'Enter Last Played Date (YYYY-MM-DD):'
    last_played_date = gets.chomp

    game = Game.new(nil, title, multiplayer, last_played_date)
    @games << game

    puts 'Game added successfully!'
  end
end
