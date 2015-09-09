require 'board.rb'

describe Board do

  it 'should respond to receive_ship' do
    is_expected.to respond_to(:place).with(1).argument
  end

  it 'should place a ship' do
    ship = Ship.new('A1')
    subject.place(ship)
    expect(subject.ship_array.empty?).to be false
  end

  it 'should have an instance of ship on board' do
    ship1 = Ship.new('A1')
    subject.place(ship1)
    expect(subject.ship_array).to include(ship1)
  end

  it 'Reports missed when no ship in position targetted' do
    expect(subject.target("A2")).to be_falsey
  end

  it 'Updates damage on the ship when hit' do
    ship = Ship.new('A1')
    subject.ship_array << ship
    subject.target('A1')
    expect(ship.damage).to eq(1)
  end

  it 'Reports if hits are successful' do
    ship = Ship.new('A1')
    subject.place(ship)
    subject.target('A1')
    expect(subject.report_hit).to eq('Hit')
  end

  it 'Reports if hits are unsuccessful' do
    ship = Ship.new('A1')
    subject.place(ship)
    subject.target('A2')
    expect(subject.report_hit).to eq('Missed')
  end

  it 'Reports if all ships are sunk' do
    ship = Ship.new ('A1')
    subject.ship_array << ship
    subject.target('A1')
    expect(subject.all_sunk?).to be true
  end

  it 'Reports if not all ships are sunk' do
    ship = Ship.new ('A1')
    subject.ship_array << ship
    subject.target('A2')
    expect(subject.all_sunk?).to be false
  end
end
