require 'player.rb'
describe Player do

  it 'responds to place method with argument of ship' do
    expect(subject).to respond_to(:place).with(1).argument
  end

  it 'Reports that not all ships are sunk' do
    ship = Ship.new('A1')
    subject.board.place(ship)
    expect(subject.status).to eq("Still in the game")
  end

  it 'raises an error when the Game is Over' do
  	ship = Ship.new('A1')
  	subject.board.place(ship)
  	expect{subject.fire('A1')}.to raise_error 'Game Over'
  end

  it 'can fire on ships' do
  	ship = Ship.new('A1')
  	ship2 = Ship.new('B2')
  	subject.board.place(ship)
  	subject.board.place(ship2)
  	subject.fire('A1')
  	expect(ship.damage).to eq 1
  end

end