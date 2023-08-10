require_relative 'app'

class Main
  OPTIONS = {
    1 => 'List all books', 2 => 'List all music albums', 3 => 'List all movies',
    4 => 'List all games', 5 => 'List all genres', 6 => 'List all labels',
    7 => 'List all authors', 8 => 'List all sources', 9 => 'Add a book',
    10 => 'Add a music album', 11 => 'Add a movie', 12 => 'Add a game',
    0 => 'Exit'
  }.freeze

  def initialize
    @app = App.new
    prompt
  end

  def prompt
    loop do
      display_options
      option = take_input

      break if option.zero?

      @app.run(option)
    end
  end

  def display_options
    OPTIONS.each { |number, description| puts "#{number}. #{description}" }
  end

  def take_input
    option = nil
    loop do
      print 'Enter a number: '
      option = gets.chomp.to_i
      break if OPTIONS.key?(option)

      puts 'ENVALILD! Please insert valid option'
    end

    option
  end
end

Main.new
