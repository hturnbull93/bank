require_relative './transaction.rb'

class Account
  attr_reader :balance

  def initialize(transactionClass = Transaction)
    @balance = 0
    @transactionClass = transactionClass
    @transactionHistory = []
  end

  def deposit(amount)
    @balance += amount
    @transactionHistory.unshift @transactionClass.new(credit: amount, balance: @balance)
  end
  
  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount
    
    @balance -= amount
    @transactionHistory.unshift @transactionClass.new(debit: amount, balance: @balance)
  end

  def statement
    header = "date || credit || debit || balance\n"
    statementRows = @transactionHistory.map do |transaction|
      transaction.display
    end

    header + statementRows.join("\n")
  end
end