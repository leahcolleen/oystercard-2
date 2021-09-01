class Oystercard
  
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize 
    @balance = 0
 
  end

  def top_up(value)
    raise "Exceeds £90" if value + balance > MAX_BALANCE
    @balance += value
  end

end