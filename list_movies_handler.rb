require_relative 'handler'

# Handler class for listing all movies in the catalog.
class ListMoviesHandler < Handler
  def initialize(movies)
    @movies = movies
  end

  def handle
    puts 'List of all movies:'
    @movies.each_with_index do |movie, index|
      puts "#{index + 1}. #{movie.title} (Silent: #{movie.silent ? 'Yes' : 'No'}, Last Published: #{movie.publish_date})"
    end
  end
end
