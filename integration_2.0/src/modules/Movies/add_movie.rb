require_relative '../../Classes/movie'
require_relative '../../Classes/source'
module AddMovie
  def add_movie
    print 'Published date: '
    publish_date = gets.chomp
    print 'Movie is silent? [Y/N]: '
    silent = gets.chomp.upcase == 'Y'
    print 'Source name: '
    source_name = gets.chomp
    source = Source.new(source_name)
    movie = Movie.new(source, publish_date, silent)
    @movies << movie
    puts 'Movie Added successfully'
  end
end
