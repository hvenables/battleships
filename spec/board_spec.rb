require 'board.rb'

describe Board do

  let(:ship) { double :ship, position: 'A1', hit: nil, sunk?: true }
  let(:sunk_ship) { double :ship, position: 'A1', hit: nil, sunk?: false }

  it 'should respond to receive_ship' do
    is_expected.to respond_to(:place).with(1).argument
  end

  it 'should place a ship' do
    subject.place(ship)
    expect(subject.ship_array.empty?).to be false
  end

  it 'should have an instance of ship on board' do
    subject.place(ship)
    expect(subject.ship_array).to include(ship)
  end

  it 'Reports missed when no ship in position targetted' do
    expect(subject.target("A2")).to be_falsey
  end

  it 'Reports if hits are successful' do
    subject.place(ship)
    subject.target('A1')
    expect(subject.report_hit).to eq('Hit')
  end

  it 'Reports if hits are unsuccessful' do
    subject.place(ship)
    subject.target('A2')
    expect(subject.report_hit).to eq('Missed')
  end

  it 'Reports if all ships are sunk' do
    # allow(:ship).to receive(:sunk?).and_return(:true)
    subject.ship_array << ship
    subject.target('A1')
    expect(subject.all_sunk?).to be true
  end

  it 'Reports if not all ships are sunk' do
    subject.ship_array << sunk_ship
    subject.target('A2')
    expect(subject.all_sunk?).to be false
  end
end
