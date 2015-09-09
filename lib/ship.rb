class Ship

  attr_reader :position, :damage

  def initialize(position)
    @position = position
    @damage = 0
  end

  def hit
    @damage += 1
  end

  def sunk?
    damage == 1
  end

end
