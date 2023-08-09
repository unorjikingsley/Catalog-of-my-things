# This console application, built with Ruby, provides a user-friendly interface for collecting personal catalog data.
# It offers a convenient way to organize and store catalog information, ensuring data preservation and flexibility.
# The application allows users to input their catalog items of interest, and saves the data in a JSON file format.

require_relative 'app'

def main
  app = App.new
  app.exit = false
  until app.exit
    puts
    app.display_menu
    choice = gets.chomp
    app.menu_options[choice]&.call
  end
end

main
