class Game
  def initialize(players)
    @players = players
  end

  def over?
    @players.select {|player| player.points >= 100}.any?
  end

  def winner
    @players.max_by {|player| player.points}
  end
end