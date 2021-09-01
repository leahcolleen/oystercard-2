require 'oystercard'

describe Oystercard do
  subject (:oystercard) { described_class.new }

  it 'checks new card has a balance' do
    expect(oystercard.balance).to eq(0)
  end

  describe '#top_up(value)' do
    it 'adds money to card' do
      expect { oystercard.top_up(1) }.to change { oystercard.balance }.by(1)
    end 

    it 'raises an error if value exceeds £90' do
      max_balance = Oystercard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect { oystercard.top_up 1 }.to raise_error "Exceeds £90"
    end
  end
  
  it { expect(oystercard).to respond_to(:deduct).with(1).argument }

  describe "#deduct" do
    it "deducts fare from oystercard" do
      oystercard.top_up(30)
      expect { oystercard.deduct(1) }.to change { oystercard.balance }.by(-1)
    end
  end
end        