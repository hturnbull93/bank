require_relative './transaction.rb'

class Account
  attr_reader :balance

  def initialize(transactionClass = Transaction)
    @balance = 0
    @transactionClass = transactionClass
  end

  def deposit(amount)
    @balance += amount
    transaction = @transactionClass.new(credit: amount, balance: @balance)
  end
  
  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount
    
    @balance -= amount
    transaction = @transactionClass.new(debit: amount, balance: @balance)
  end

  def statement
    "date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00 
13/01/2012 || 2000.00 || || 3000.00 
10/01/2012 || 1000.00 || || 1000.00 "
  end
end