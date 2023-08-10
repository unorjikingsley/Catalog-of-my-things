module DisplayBooks
  def display_books
    puts '------------------------------------------------'
    if @books.empty?
      puts 'No books yet found, feel free to add books'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) publisher: '#{book.publisher}',
         cover-state: '#{book.cover_state}' Published at: '#{book.publish_date}'"
      end
    end
    puts '------------------------------------------------'
  end
end
