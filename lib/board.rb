require './lib/ship.rb'
class Board
  attr_reader :ship_array, :hit_array, :missed_array, :target

  def initialize
    @ship_array = []
    @sunk_array = []
    @hit_array = []
    @missed_array = []
  end

  def place(ship)
      ship_array << ship
  end

  def target(co)
    @target = co
    receive_hit
    remove_sunk
  end

  def all_sunk?
    ship_array.empty?
  end

  def report_hit
    been_hit? == false ? 'Missed' : 'Hit'
  end

  private

  def remove_sunk
    ship_array.find do |ship|
      if ship.sunk?
        @sunk_array << ship
        @ship_array.delete(ship)
      end
    end
  end

  def receive_hit
    ship_array.find do |ship|
      if ship.position == @target
        @hit_array << @target
        ship.hit
      else
        @missed_array << @target
      end
    end
  end

  def been_hit?
    hit_array.one? { |coordinates| coordinates == @target }
  end
end
