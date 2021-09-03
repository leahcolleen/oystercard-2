class Oystercard
  
  MIN_FARE = 1
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize 
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Exceeds £90" if value + balance > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Less than £1" if balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false 
  end

  private
  
  def deduct(fare)
      @balance -= fare
  end
end
