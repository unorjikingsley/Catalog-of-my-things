require_relative 'item'

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
