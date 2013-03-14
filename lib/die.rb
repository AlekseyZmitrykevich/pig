class Die
  attr_reader :roll

  def roll!
    @roll = rand(1..6)
  end
end