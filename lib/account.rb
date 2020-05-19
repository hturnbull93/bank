# frozen_string_literal: true

require_relative './transaction.rb'
require_relative './printer.rb'
require_relative './conversion.rb'

class Account
  include Conversion

  STATEMENT_HEADER = "date || credit || debit || balance\n"
  STARTING_BALANCE = 0

  def initialize(transaction_class: Transaction, printer_class: Printer)
    @balance = STARTING_BALANCE
    @transaction_class = transaction_class
    @printer = printer_class.new
    @transaction_history = []
  end

  def deposit(amount)
    credit = to_pence(amount)
    @balance += credit
    add_deposit(credit: credit, balance: @balance)
    "#{as_pounds(credit)} deposited. Current balance: #{as_pounds(@balance)}"
  end

  def withdraw(amount)
    debit = to_pence(amount)
    return 'Insufficient funds' if @balance < pence

    @balance -= debit
    add_withrawal(debit: debit, balance: @balance)
    "#{as_pounds(debit)} withdrawn. Current balance: #{as_pounds(@balance)}"
  end

  def statement
    statement_rows = @transaction_history.map(&:display)
    @printer.print STATEMENT_HEADER
    @printer.print statement_rows
  end

  private

  def add_deposit(credit: nil, balance: nil)
    deposit = @transaction_class.new(credit: credit, balance: balance)
    @transaction_history.unshift deposit
  end

  def add_withrawal(debit: nil, balance: nil)
    withdrawal = @transaction_class.new(debit: debit, balance: balance)
    @transaction_history.unshift withdrawal
  end
end
