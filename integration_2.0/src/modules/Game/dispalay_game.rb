module DisplayGame
  def display_game
    puts '----------------------------------------------'
    if @persist_games.empty?
      puts 'No games yet found, feel free to add games'
    else
      puts 'Game: '
      @persist_games.each_with_index do |game, index|
        puts "#{index}) multiplayer: '#{game['multiplayer']}', last_played_at: '#{game['last_played_at']}'"
      end
    end
    puts '-----------------------------------------------'
  end
end
