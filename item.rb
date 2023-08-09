class Item
  attr_reader :id, :genre, :author, :label, :publish_date
  attr_accessor :archived

  def initialize(id, genre, author, label, publish_date, archived = false)
    @id = id
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    years_since_publish = (Date.today - @publish_date).to_i / 365
    years_since_publish > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
