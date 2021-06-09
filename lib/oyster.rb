class Oyster

  MAX_BALANCE = 90
  MIN_FARE = 1
  attr_reader :balance, :in_use, :entry_station

  def initialize
    @balance = 0
    @in_use = false
  end


  def top_up(money)
    fail "Oh no! You reached the max balance" if money + balance > MAX_BALANCE
    @balance = @balance + money
  end


  def touch_in(entry_station)
    raise "Ops! Top it up!" if balance < MIN_FARE
    @entry_station = entry_station
    @in_use = true
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
    @in_use = false
  end

  def in_journey?
    !!entry_station
  end

  def deduct(money)
    @balance -= money
  end

end
