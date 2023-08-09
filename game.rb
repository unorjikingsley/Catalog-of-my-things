# frozen_string_literal: true

require_relative 'item'

class Game < Item
  attr_accessor :title, :multiplayer, :last_played_at

  def initialize(id, title, multiplayer, last_played_at, archived = false)
    super(id, nil, nil, nil, nil, archived)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_at <= 2.years.ago
  end
end
