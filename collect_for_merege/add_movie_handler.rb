# frozen_string_literal: true

require_relative 'handler'
require_relative 'movie'
require_relative 'add_genre_handler'
require_relative 'add_label_handler'
require_relative 'add_source_handler'

class AddMovieHandler < Handler
  def initialize(movies, genres, authors, labels)
    @movies = movies
    @genres = genres
    @authors = authors
    @labels = labels
  end

  def handle
    title = add_movie_title
    genre = add_genre
    author = add_author
    label = add_label
    publish_date = add_publish_date
    silent = add_silent

    id = @movies.empty? ? 1 : @movies.last.id + 1
    movie = Movie.new(id, title, genre, author, label, publish_date, silent)
    @movies << movie

    puts "Movie '#{title}' added successfully!"
  end

  private

  def add_movie_title
    puts 'Enter Movie Title:'
    gets.chomp
  end

  def add_genre
    AddGenreHandler.new(@genres).handle
  end

  def add_author
    AddAuthorHandler.new(@authors).handle
  end

  def add_label
    AddLabelHandler.new(@labels).handle
  end

  def add_publish_date
    puts 'Enter Publish Date (YYYY-MM-DD):'
    gets.chomp
  end

  def add_silent
    puts 'Is the movie silent? (true/false):'
    gets.chomp.downcase == 'true'
  end
end
