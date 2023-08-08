class ListAuthorsHandler < Handler
  def handle
    authors = Author.all
    if authors.empty?
      puts "No authors found."
    else
      puts "List of authors:"
      authors.each do |author|
        puts "#{author.id}. #{author.first_name} #{author.last_name}"
      end
    end
  end
end
