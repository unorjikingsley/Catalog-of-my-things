require 'date'
require_relative 'item'

class Game < Item
  ##
  # The Game class represents a game item created by an author.
  # It inherits from the Item class and provides additional attributes and functionalities specific to games.

  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Date.today.to_time.year - @last_played_at.year) > 2
  end
end
