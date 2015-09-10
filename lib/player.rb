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
    board.target(co)
    "#{board.report_hit}, #{status}"
  end

  def status
    fail 'Game Over' if board.all_sunk?
    'Still in the game'
  end

end
