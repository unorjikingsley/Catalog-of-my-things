class Item
  attr_reader :genre, :author, :source, :label, :published_date

  def initialize(author, source, label, published_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = published_date
    @archived = false
  end

  def can_be_archived?
    (Date.today.year - published_date.year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, source, published_date, publisher, cover_state)
    super(genre, source, published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super.can_be_archived? || cover_state == 'bad'
  end
end
