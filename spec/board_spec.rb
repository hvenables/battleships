require 'board.rb'

describe Board do

  it 'should respond to receive_ship' do
    is_expected.to respond_to(:receive_ship).with(1).argument
  end

  it 'should have an instance of ship on board' do
    ship1 = Ship.new "A1"
    subject.receive_ship(ship1)
    expect(subject.ship_array).to include(ship1)
  end

  # it 'can expect method receive_hit' do
  #   is_expected.to respond_to :receive_hit
  # end

  # it 'can actually receive hits' do
  #   ship = Ship.new('A1')
  #   subject.ship_array << ship
  #   subject.fire("A1")
  #   expect(ship.damage).to be_true
  # end

  # it 'can actually receive Missed' do
  #   ship = Ship.new('A1')
  #   subject.ship_array << ship
  #   subject.fire("A2")
  #   expect(subject.receive_hit).to be_falsey
  # end

  it 'Reports missed when no ship in position targetted' do
    ship = Ship.new('A1')
    subject.ship_array << ship
    expect(subject.fire("A2")).to eq(["Missed", "Still in the game"])
  end

  # it 'Reports Hit when ship in position targetted' do
  #   ship = Ship.new('A1')
  #   subject.ship_array << ship
  #   expect(subject.fire("A1")).to eq(["Hit", "Still in the game"])
  # end

  it 'Updates damage on the ship when hit' do
    ship = Ship.new('A1')
    subject.ship_array << ship
    subject.fire('A1')
    expect(ship.damage).to eq(1)
  end

  it 'Reports that not all ships are sunk' do
    ship = Ship.new('A1')
    subject.ship_array << ship
    expect(subject.status).to eq("Still in the game")
  end

  it 'Reports if all ships are sunk' do
    ship = Ship.new ('A1')
    subject.ship_array << ship
    expect(subject.fire('A1')).to eq(["Hit", "Game Over"])
  end
end
