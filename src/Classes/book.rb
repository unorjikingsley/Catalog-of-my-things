require_relative 'item'

class Book < Item
  ##
  # The Book class represents a book item created by an author.
  # It inherits from the Item class and provides additional attributes and functionalities specific to books.

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
