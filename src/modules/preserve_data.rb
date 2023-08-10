require 'json'

module PreserveData
  LABELS_FILE_NAME = 'src/Store/labels.json'.freeze
  BOOKS_FILE_NAME = 'src/Store/books.json'.freeze
  ALBUMS_FILE_NAME = 'src/Store/music_albums.json'.freeze
  GENRES_FILE_NAME = 'src/Store/genres.json'.freeze
  MOVIES_FILE_NAME = 'src/Store/movies.json'.freeze
  SOURCE_FILE_NAME = 'src/Store/source.json'.freeze

  def preserve_data
    save_books
    save_labels
    save_albums
    save_genres
    save_movies
    save_sources
  end

  def save_books
    books_hash = []
    @books.each do |book|
      book_hash = {
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date,
        label: {
          title: book.label.title,
          color: book.label.color
        }
      }
      books_hash << book_hash
    end
    save_to_file(BOOKS_FILE_NAME, books_hash)
  end

  def save_labels
    labels_hash = @labels.map do |label|
      {
        title: label.title,
        color: label.color
      }
    end
    save_to_file(LABELS_FILE_NAME, labels_hash)
  end

  def save_albums
    albums_hash = []
    @albums.each do |album|
      album_hash = {
        on_spotify: album.on_spotify,
        Genre: album.genre.name,
        publish_date: album.publish_date
      }
      albums_hash << album_hash
    end
    save_to_file(ALBUMS_FILE_NAME, albums_hash)
  end

  def save_genres
    genres_hash = @genres.map do |genre|
      {
        name: genre.name
      }
    end
    save_to_file(GENRES_FILE_NAME, genres_hash)
  end

  def save_movies
    movies_hash = []
    @movies.each do |mov|
      movies_hash << {
        publish_date: mov.publish_date,
        silent: mov.silent,
        source: mov.source.name
      }
    end
    save_to_file(MOVIES_FILE_NAME, movies_hash)
  end

  def save_sources
    sources_hash = []
    @sources.each do |source|
      sources_hash << {
        name: source.name,
        id: source.id
      }
    end
    save_to_file(SOURCE_FILE_NAME, sources_hash)
  end

  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end
end
