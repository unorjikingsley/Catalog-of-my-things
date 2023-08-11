module AddMovie
  def add_movie
    publish_date = input_date
    silet = input_silet
    movie = Movie.new(publish_date: publish_date, silet: silet)
    @movies << movie
    source = add_source
    movie.add_source(source)
    # source.add_item(movie)
    # @sources << source
    puts 'Source Added Successfully'
  end

  def input_date
    puts 'Please Enter publish date in following format: yyyy/mm/dd'
    gets.chomp
  end

  def add_source
    puts 'Add a source'
    puts 'Enter source Name'
    input = gets.chomp
    return_source(input)
  end

  def return_source(input)
    @source.each_with_index do |source, _index|
      return source if source.name == input
    end
    new_source = Source.new(name: input)
    @sources << new_source
    new_source
  end

  def input_silet
    puts 'Is the movie silet? Press 1 for true, 2 for false'
    silet = gets.chomp.to_i
    while silet.nil? || silet < 1 || silet > 2
      puts 'input number between 1 and 2'
      silet = gets.chomp.to_i
    end

    silet == 1
  end
end
