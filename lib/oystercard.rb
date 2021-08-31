class Oystercard
  
  attr_reader :balance

  def initialize 
    @balance = 0
    # @count = []
  end

  def top_up(value)
    @balance += value
  end

  # def count
  #   count += 1
  #   @count << count
  # end 

end