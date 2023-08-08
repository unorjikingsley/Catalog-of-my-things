class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def can_be_archived?
    super && last_played_at <= 2.years.ago
  end
end
