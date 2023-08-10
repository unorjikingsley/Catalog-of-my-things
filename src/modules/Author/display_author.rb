module DisplayAuthor
  def display_author
    puts '-------------------------------------------------'
    if @persist_authors.empty?
      puts 'No author yet found, feel free to add authors'
    else
      puts 'Game: '
      @persist_authors.each_with_index do |author, index|
        puts "#{index}) first_name: '#{author['first_name']}', last_name: '#{author['last_name']}'"
      end
    end
    puts '------------------------------------------------'
  end
end
