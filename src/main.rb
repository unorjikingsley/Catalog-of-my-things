require_relative 'app'

class Main
  ##
  # The Main class represents the main entry point of the application.
  # It initializes and manages the execution of the App class.

  def initialize
    @app = App.new
  end

  def run
    loop do
      @app.display_options
      option = take_input

      break if option.zero?

      @app.run(option)
    end
  end

  def take_input
    option = nil
    loop do
      print 'Enter a number: '
      option = gets.chomp.to_i
      break if @app.option?(option)

      puts 'ENVALILD! Please insert valid option'
    end

    option
  end
end

app = Main.new
app.run
