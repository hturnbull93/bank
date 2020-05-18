class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance < amount
      raise 'Insufficient funds'
    end
    @balance -= amount
  end
end