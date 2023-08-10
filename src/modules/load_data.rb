require_relative '../Classes/label'
require_relative '../Classes/book'
require_relative '../Classes/genre'
require_relative '../Classes/music_album'
require_relative '../Classes/movie'
require_relative '../Classes/source'

module LoadData
  LABELS_FILE_NAME = 'src/Store/labels.json'.freeze
  BOOKS_FILE_NAME = 'src/Store/books.json'.freeze
  ALBUMS_FILE_NAME = 'src/Store/music_albums.json'.freeze
  GENRES_FILE_NAME = 'src/Store/genres.json'.freeze
  MOVIES_FILE_NAME = 'src/Store/movies.json'.freeze
  SOURCE_FILE_NAME = 'src/Store/source.json'.freeze

  def load_data
    load_books
    load_labels
    load_albums
    load_genres
    load_movies
    load_sources
  end

  def load_books
    books_hash = []
    return books_hash unless File.exist?(BOOKS_FILE_NAME)

    books_hash = load_data_from_file(BOOKS_FILE_NAME)
    books_hash.each do |book|
      label = Label.new(book['label']['title'], book['label']['color'])
      @books << Book.new(label, book['publisher'], book['cover_state'], book['publish_date'])
    end
  end

  def load_labels
    labels_hash = []
    return labels_hash unless File.exist?(LABELS_FILE_NAME)

    labels_hash = load_data_from_file(LABELS_FILE_NAME)
    @labels = labels_hash.map do |label|
      Label.new(label['title'], label['color'])
    end
  end

  def load_albums
    albums_hash = []
    return albums_hash unless File.exist?(ALBUMS_FILE_NAME)

    albums_hash = load_data_from_file(ALBUMS_FILE_NAME)
    albums_hash.each do |album|
      genre = Genre.new(album['Genre'])
      @albums << MusicAlbum.new(genre, album['on_spotify'], publish_date: album['publish_date'])
    end
  end

  def load_genres
    genres_hash = []
    return genres_hash unless File.exist?(GENRES_FILE_NAME)

    genres_hash = load_data_from_file(GENRES_FILE_NAME)
    @genres = genres_hash.map do |genre|
      Genre.new(genre['name'])
    end
  end

  def load_movies
    movies_hash = []
    return movies_hash unless File.exist?(MOVIES_FILE_NAME)

    movies_hash = load_data_from_file(MOVIES_FILE_NAME)
    @movies = movies_hash.map do |movie|
      Movie.new(Source.new(movie['source']), movie['publish_date'], movie['silent'])
    end
  end

  def load_sources
    sources_hash = []
    return sources_hash unless File.exist?(SOURCE_FILE_NAME)

    sources_hash = load_data_from_file(SOURCE_FILE_NAME)
    @sources = sources_hash.map do |source|
      Source.new(source['name'])
    end
  end

  def load_data_from_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end
end
