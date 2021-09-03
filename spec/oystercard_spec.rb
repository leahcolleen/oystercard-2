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

  describe '#in_journey' do
    it 'journey is not taking place' do
      expect(oystercard).not_to be_in_journey 
    end 

    it 'needs minimum balance of £1' do
      expect { oystercard.touch_in }.to raise_error "Less than £1"
    end

    it 'be in a journey on touch in' do
      min_fare = Oystercard::MIN_FARE
      oystercard.top_up(min_fare)
      oystercard.touch_in
      expect(oystercard).to be_in_journey 
    end 

    it 'not be in journey on touch out' do
      min_fare = Oystercard::MIN_FARE
      oystercard.top_up(min_fare)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
      expect {oystercard.touch_out}.to change{oystercard.balance}.by(-Oystercard::MIN_FARE)
    end 
  end 
end        