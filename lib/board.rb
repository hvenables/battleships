require '~/Projects/battle_ships/lib/ship.rb'
class Board

  attr_reader :ship_array, :hit_array, :missed_array

  def initialize
    @ship_array = []
    @sunk_array = []
    @hit_array = []
    @missed_array = []
  end

  def receive_ship(ship)
    ship_array << ship
  end

  def fire(co)
    @fire = co
    receive_hit
    remove_sunk
    return report_hit, status
  end

  def status
    all_sunk? ? "Game Over" : "Still in the game"
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
    ship_array.each do |ship|
      if ship.position == @fire
        @hit_array << @fire
        ship.hit
      else
        @missed_array << @fire
      end
    end
  end

  def been_hit?
    hit_array.one?{ |coordinates| coordinates == @fire }
  end

  def report_hit
    been_hit? == false ? "Missed" : "Hit"
  end

  def all_sunk?
    ship_array.empty?
  end
end
