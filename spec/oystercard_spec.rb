require 'oystercard'

describe Oystercard do
  subject (:oystercard) { described_class.new }

  it 'checks new card has a balance' do
    expect(oystercard.balance).to eq(0)
  end

  describe '#top_up(value)' do
    it 'adds money to card' do
      # expect(oystercard).to respond_to(:top_up).with(1).argument
      expect { oystercard.top_up(1) }.to change { oystercard.balance }.by(1)
    end 
  end
end        