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
    last_played_at, multiplayer, publish_date = game_details
    author = create_author
    game = create_game_instance(multiplayer, last_played_at, publish_date)
    add_author_and_game(author, game)
    persist_author_data(author)
    persist_game_data(game)
    puts 'Game created successfully'
  end

  def game_details
    print 'last_played_at (yyyy-mm-dd): '
    last_played_at = gets.chomp
    print 'multiplayer: '
    multiplayer = gets.chomp
    print 'publish_date (yyyy-mm-dd): '
    publish_date = gets.chomp
    [last_played_at, multiplayer, publish_date]
  end

  def create_author
    puts 'Give it an Author:'
    print 'Name: '
    name = gets.chomp
    print 'First_Name: '
    first_name = gets.chomp
    print 'Last_name: '
    last_name = gets.chomp
    Author.new(name, first_name, last_name)
  end

  def create_game_instance(multiplayer, last_played_at, publish_date)
    Game.new(multiplayer, last_played_at, publish_date)
  end

  def add_author_and_game(author, game)
    authors << author
    games << game
  end

  def persist_author_data(author)
    author_arr = load_author
    author_arr << { name: author.name, first_name: author.first_name, last_name: author.last_name }
    persist_data('./src/Store/author.json', author_arr)
  end

  def persist_game_data(game)
    game_arr = load_game
    game_arr << { multiplayer: game.multiplayer, last_played_at: game.last_played_at }
    persist_data('./src/Store/game.json', game_arr)
  end
end
