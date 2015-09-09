require 'player.rb'
describe Player do

  it 'responds to place method with argument of ship' do
    expect(subject).to respond_to(:place).with(1).argument
  end

  it 'shouldn\'t place an object that is not a ship' do
    expect(subject.place("Hello")).to eq('Please pass a ship in')
  end

  it 'Reports that not all ships are sunk' do
    ship = Ship.new('A1')
    subject.place(ship)
    expect(subject.status).to eq("Still in the game")
  end

  it 'Can place ships on the board' do
    ship = Ship.new('A1')
    subject.place(ship)
    expect(subject.status).to eq("Still in the game")
  end

  it 'raises an error when the Game is Over' do
  	ship = Ship.new('A1')
  	subject.place(ship)
  	expect{subject.fire('A1')}.to raise_error 'Game Over'
  end

  it 'Reports Hit when ship in position targetted' do
    ship = Ship.new('A1')
    ship1 = Ship.new('B2')
    subject.place(ship)
    subject.place(ship1)
    expect(subject.fire("A1")).to eq("Hit, Still in the game")
  end

  it 'can actually receive Missed' do
    ship = Ship.new('A1')
    ship1 = Ship.new('B2')
    subject.place(ship)
    subject.place(ship1)
    expect(subject.fire("A2")).to eq('Missed, Still in the game')
  end

  it 'can fire on ships' do
  	ship = Ship.new('A1')
  	ship2 = Ship.new('B2')
  	subject.place(ship)
  	subject.place(ship2)
  	subject.fire('A1')
  	expect(ship.damage).to eq 1
  end

  it 'Reports on the squares that have been hit' do
    ship = Ship.new('A5')
    subject.place(ship)
    subject.fire('A1')
    expect(subject.report).to eq("Hits: . Missed: A1")
  end

end
