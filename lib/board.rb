require './lib/ship.rb'

class Board
  attr_reader :ship_array, :hit_array, :missed_array, :target

  def initialize(length)
    @length = length
    @ship_array = []
    @sunk_array = []
    @hit_array = []
    @missed_array = []
  end

  def place(ship)

    fail 'Ship cannot be placed there' unless in_bounds?(ship)

    ship_array.each do |i|
      fail 'Ship cannot be placed there' if overlapped?(i, ship)
    end
    ship_array << ship
    # Tests go here...
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
      if ship.position.include?(@target)
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

  def in_bounds?(ship)
  ship.position.each do |coordinates|
    coordinates.each do |i|
      return false if i > (@length - 1)
    end
  end
    true
  end

  def overlapped?(ship1, ship2)
    (ship1.position & ship2.position).any?
  end
end
