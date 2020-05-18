# frozen_string_literal: true

require_relative './transaction.rb'

class Account
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  STARTING_BALANCE = 0

  attr_reader :balance

  def initialize(transaction_class = Transaction)
    @balance = STARTING_BALANCE
    @transaction_class = transaction_class
    @history = []
  end

  def deposit(amount)
    @balance += amount
    add_deposit(credit: amount, balance: @balance)
    "#{amount} deposited"
  end
  
  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount

    @balance -= amount
    add_withrawal(debit: amount, balance: @balance)
    "#{amount} withdrawn"
  end

  def statement
    statement_rows = @history.map(&:display)
    STATEMENT_HEADER + statement_rows.join("\n")
  end

  private

  def add_deposit(credit: nil, balance: nil)
    @history.unshift @transaction_class.new(credit: credit, balance: balance)
  end

  def add_withrawal(debit: nil, balance: nil)
    @history.unshift @transaction_class.new(debit: debit, balance: balance)
  end
end
