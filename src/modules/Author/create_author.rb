require_relative '../../Classes/game'
require_relative '../../Classes/author'
require_relative '../Game/persist_data'

module CreateGame
  def persist_data(file_path, data)
    persist_data = PersistData.new(file_path)
    persist_data.save(data)
  end

  def load_author
    persist_data = PersistData.new('./src/Store/author.json')
    persist_data.load
  end

  def load_game
    persist_data = PersistData.new('./src/Store/game.json')
    persist_data.load
  end

  def create_game
    print 'last_played_at:(yyyy-mm-dd): '
    last_played_at = gets.chomp
    print 'multiplayer: '
    multiplayer = gets.chomp
    print 'publish_date(yyyy-mm-dd): '
    publish_date = gets.chomp

    puts 'Give it an Author:'
    print 'Name: '
    name = gets.chomp
    print 'First_Name: '
    first_name = gets.chomp
    print 'Last_name:'
    last_name = gets.chomp
    author_list = Author.new(name, first_name, last_name)

    game_list = Game.new(multiplayer, last_played_at, publish_date)
    author_list.add_item(game_list)

    @authors << author_list
    @games << game_list

    author_arr = load_author
    game_arr = load_game

    @authors.each do |author_|
      author_arr << { name: author_.name, first_name: author_.first_name, last_name: author_.last_name }
    end

    persist_data('./src/Store/author.json', author_arr)

    @games.each do |game_|
      game_arr << { multiplayer: game_.multiplayer, last_played_at: game_.last_played_at }
    end

    persist_data('./src/Store/game.json', game_arr)
    puts 'Game created successfully'
  end
end
