require_relative 'board.rb'

class Player
  attr_reader :board

  def initialize
    @board = Board.new(10)
  end

  def place(_ship)
    board.place(_ship)
  end

  def report
    "Hits: #{(board.hit_array).join(', ')}. Missed: #{(board.missed_array).join(', ')}"
  end

  def fire(co)
    if (board.hit_array.concat(board.missed_array)).include?(co)
      'Cannot fire on the same coordinates'
    else
      board.target(co)
      "#{board.report_hit}, #{status}"
    end
  end

  def status
    fail 'Game Over' if board.all_sunk?
    'Still in the game'
  end
end
