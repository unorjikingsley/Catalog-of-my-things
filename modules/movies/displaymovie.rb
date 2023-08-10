module DisplayMovie
  def display_all_movies
    @movies.each_with_index do |movie, index|
      source_name = movie.source ? movie.source.name : 'N/A'
      puts "#{index}) silet: #{movie.silet}, Publish Date: #{movie.publish_date} Source: #{source_name}"
    end
  end
end

# puts "#{index}) Silent: #{movie.silent}, Publish Date: #{movie.publish_date} Source: #{movie.source.name}"
