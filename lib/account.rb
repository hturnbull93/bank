# frozen_string_literal: true

require_relative './transaction.rb'

class Account
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  attr_reader :balance

  def initialize(transactionClass = Transaction)
    @balance = 0
    @transactionClass = transactionClass
    @transactionHistory = []
  end

  def deposit(amount)
    @balance += amount
    addDepositTransaction(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount

    @balance -= amount
    addWithdrawTransaction(debit: amount, balance: @balance)
  end

  def statement
    statementRows = @transactionHistory.map(&:display)
    STATEMENT_HEADER + statementRows.join("\n")
  end

  private
  
  def addDepositTransaction(credit: nil, balance: nil)
    @transactionHistory.unshift @transactionClass.new(credit: credit, balance: balance)
  end

  def addWithdrawTransaction(debit: nil, balance: nil)
    @transactionHistory.unshift @transactionClass.new(debit: debit, balance: balance)
  end
end
