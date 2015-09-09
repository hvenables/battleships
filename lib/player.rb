require_relative 'board.rb'

class Player
	attr_reader :board
  def initialize
  	@board = Board.new
  end
  def place(ship)
  end

  def status
      	fail 'Game Over' if board.all_sunk? 
      	return "Still in the game"
  end



  def fire(co)
    board.target(co)
	return board.report_hit ,status  
  end
end
