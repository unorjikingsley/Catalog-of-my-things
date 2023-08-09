# frozen_string_literal: true

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, _title, genre, author, label, publish_date, archived = false, publisher = '', cover_state = '')
    super(id, genre, author, label, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
