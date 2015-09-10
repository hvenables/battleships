require 'ship.rb'

describe Ship do
  subject { Ship.new(1, [0, 0], 'N') }

  ship1 = Ship.new(3, [0, 0], 'N')
  ship2 = Ship.new(3, [4, 4], 'W')

  it 'occupies the right cells when created facing north' do
    expect(ship1.position).to eq([[0, 0], [0, 1], [0, 2]])
  end

  it 'occupies the right cells when created facing west' do
    expect(ship2.position).to eq([[4, 4], [3, 4], [2, 4]])
  end

  describe '#hits'
  it 'It is initialized with no hits' do
    expect(subject.damage).to eq(0)
  end
  it 'Will count hits when recieved' do
    subject.hit
    expect(subject.damage).to eq(1)
  end
  it 'Can sink ships' do
    subject.hit
    expect(subject.sunk?).to be true
  end
end
