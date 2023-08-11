require_relative '../item'

class Movie < Item
  attr_reader :silet, :publish_date
  attr_accessor :source

  def initialize(silet:, publish_date:)
    super(publish_date)
    @silet = silet
    @source = 'N/A'
  end

  def can_be_archived?
    super() || @silet
  end

  def to_hash
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'silet' => @silet,
      'source' => @source || ''
    }
  end
end

test = Source.new(silet: true, publish_date: '2012/04/03')
puts test.can_be_archived?
