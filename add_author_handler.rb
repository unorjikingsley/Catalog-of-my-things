require_relative 'handler'
require_relative 'author'

# Handler class for adding an author to the catalog.
class AddAuthorHandler < Handler
  def initialize(authors)
    @authors = authors
  end

  def handle
    first_name = add_author_first_name
    last_name = add_author_last_name

    id = @authors.empty? ? 1 : @authors.last.id + 1
    author = Author.new(first_name: first_name, last_name: last_name)
    @authors << author

    puts "Author '#{first_name} #{last_name}' added successfully!"
  end

  private

  def add_author_first_name
    puts 'Enter Author First Name:'
    gets.chomp
  end

  def add_author_last_name
    puts 'Enter Author Last Name:'
    gets.chomp
  end
end
