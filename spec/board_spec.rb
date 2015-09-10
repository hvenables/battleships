require 'board.rb'

describe Board do

  subject { Board.new(10) }

  let(:ship) { double :ship, position: [[0,0], [0,1]], hit: nil, sunk?: true }
  let(:sunk_ship) { double :ship, position: [[0,0]], hit: nil, sunk?: false }


  it 'should respond to receive_ship' do
    is_expected.to respond_to(:place).with(1).argument
  end

  it 'should place a ship' do
    subject.place(ship)
    expect(subject.ship_array.empty?).to be false
  end

  it 'should not place a ship which would be off the board' do
    subject.place(ship)
    expect(subject.ship_array.empty?).to be false
  end

  it 'should place a ship which overlaps another ship' do
    overlapping_ship = double(:ship, position: [[0,0]])
    subject.place(ship)
    expect { subject.place(overlapping_ship) }.to raise_error 'Ship overlaps an existing ship'
  end

  it 'should have an instance of ship on board' do
    subject.place(ship)
    expect(subject.ship_array).to include(ship)
  end

  it 'Reports missed when no ship in position targetted' do
    expect(subject.target([0,2])).to be_falsey
  end

  it 'Reports if hits are successful' do
    subject.place(ship)
    subject.target([0,1])
    expect(subject.report_hit).to eq('Hit')
  end

  it 'Reports if hits are unsuccessful' do
    subject.place(ship)
    subject.target([0,2])
    expect(subject.report_hit).to eq('Missed')
  end

  it 'Reports if all ships are sunk' do
    # allow(:ship).to receive(:sunk?).and_return(:true)
    subject.ship_array << ship
    subject.target([0,0])
    expect(subject.all_sunk?).to be true
  end

  it 'Reports if not all ships are sunk' do
    subject.ship_array << sunk_ship
    subject.target([0,2])
    expect(subject.all_sunk?).to be false
  end
end
