require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(1..1000)
    @archived = archived
    @publish_date = publish_date
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

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end

  def to_hash
    {
      genre: @genre,
      author: @author,
      source: @source,
      label: { title: @label.title, color: @label.color },
      publish_date: @publish_date.strftime('%Y-%m-%d'),
      archived: @archived,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end
end
