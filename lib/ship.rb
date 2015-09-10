class Ship
  attr_reader :position, :damage

  def initialize(length, origin, orientation)
    @position = []
    @damage = 0
    @length = length

    length.times do |i|
      case orientation
      when 'N'
        @position << [origin[0], (origin[1] + i)]
      when 'E'
        @position << [(origin[0] + i), origin[1]]
      when 'S'
        @position << [origin[0], (origin[1] - i)]
      when 'W'
        @position << [(origin[0] - i), origin[1]]
      end
    end
  end

  def hit
    @damage += 1
  end

  def sunk?
    damage >= @length
  end
end
