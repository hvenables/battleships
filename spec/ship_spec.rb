require 'ship.rb'

describe Ship do

  subject {Ship.new([0,0])}

  it 'has a position when created' do
    expect(subject.position).to eq([0,0])
  end

  describe "#hits"
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
