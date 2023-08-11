require 'date'
require_relative 'movie/source'
require_relative 'music/genre'

class Item
  attr_reader :id
  attr_accessor :genre, :author, :label, :publish_date, :archived, :source

  def initialize(publish_date, id = nil)
    @id = id || Random.rand(1..1000)
    # @genre = genre - already in the function
    @author = author
    # @source = source - already in the function
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    # genre.items << self unless genre.items.include?(self)
  end

  def add_author; end

  def add_label; end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def can_be_archived?
    current_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    current_year - publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
