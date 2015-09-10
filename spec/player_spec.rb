require 'player.rb'

describe Player do

  let(:ship) { double :ship, position: [[0,0]], hit: nil, damage: 1, sunk?: false }
  let(:ship_sunk) { double :ship, position: [[0,2]], hit: nil, sunk?: true }
  let(:ship1) { double :ship, position: [[0,2]], hit: nil, sunk?: false }

  it 'responds to place method with argument of ship' do
    expect(subject).to respond_to(:place).with(1).argument
  end

  it 'Reports that not all ships are sunk' do
    subject.place(ship)
    expect(subject.status).to eq("Still in the game")
  end

  it 'Can place ships on the board' do
    subject.place(ship)
    expect(subject.status).to eq("Still in the game")
  end

  it 'raises an error when the Game is Over' do
  	subject.place(ship_sunk)
  	expect{subject.fire([0,0])}.to raise_error 'Game Over'
  end

  it 'Reports Hit when ship in position targetted' do
    subject.place(ship)
    subject.place(ship1)
    expect(subject.fire([0,0])).to eq("Hit, Still in the game")
  end

  it 'can actually receive Missed' do
    subject.place(ship)
    subject.place(ship1)
    expect(subject.fire([0,2])).to eq('Missed, Still in the game')
  end

  it 'can fire on ships' do
  	subject.place(ship)
  	subject.place(ship1)
  	subject.fire([0,0])
  	expect(ship.damage).to eq 1
  end

  it 'Reports on the squares that have been hit' do
    subject.place(ship1)
    subject.fire([0,0])
    expect(subject.report).to eq("Hits: . Missed: 0, 0")
  end

end
