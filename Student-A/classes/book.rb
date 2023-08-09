require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(1..1000)
    @publish_date = Date.strptime(publish_date, '%Y-%m-%d')
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def add_source(source)
    @source = source
  end

  def move_to_archive?
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end
end

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(label, publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    add_label(label)
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end