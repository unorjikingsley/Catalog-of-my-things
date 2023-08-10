module DisplayGenres
  def display_genres
    puts '----------------'
    if @genres.empty?
      puts 'No genres yet found, feel free to add genres'
    else
      puts 'Genres: '
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}) name: #{genre.name}"
      end
    end
    puts '----------------'
  end
end
