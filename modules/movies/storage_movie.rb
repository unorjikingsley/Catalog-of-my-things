require 'json'

module StorageMovie
  def save_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_movie
    save_movie
    save_sources
  end

  def save_movie
    json_data = @movies.map(&:to_hash)
    save_file('data/movies.json', json_data)
  end

  def save_sources
    json_data = @sources.map(&:to_hash)
    save_file('data/sources.json', json_data)
  end

  def load_file(file_name)
    data = File.read(file_name)
    JSON.parse(data)
  end

  def load_movies
    movies_hash = []
    return movies_hash unless File.exist?('data/movies.json')

    movies_hash = load_file('data/movies.json')

    movies_hash.each do |movie|
      movie_obj = MusicAlbum.new(publish_date: movie['publish_date'], silet: movie['silet'],
                                 id: movie['id'])
      source_obj = @sources.find { |source| source.name == movie['source'] }
      movie_obj.add_source(source_obj)
      @movies << movie_obj
    end
  end

  def load_sources
    source_hash = []
    return source_hash unless File.exist?('data/sources.json')

    source_hash = load_file('data/sources.json')
    source_hash.each do |source|
      source_obj = Source.new(name: source['name'], id: source['id'])
      @sources << source_obj
    end
  end
end
