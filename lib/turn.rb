class Turn
  attr_reader :points

  def initialize(player)
    @player = player
    @over = false
    @points = 0
  end

  def over?
    @over
  end

  def roll(die)
    die.roll!
    roll = die.roll
    if roll == 1
      @over = true
      @points = 0
    else
      @points += roll
    end
  end

  def hold
    @over = true
    @player.add_points(@points)
  end
end