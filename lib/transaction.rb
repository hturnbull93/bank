# frozen_string_literal: true

require_relative './conversion.rb'

class Transaction
  include Conversion

  def initialize(credit: nil, debit: nil, balance: nil)
    @time = Time.now
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def display
    "#{time} || #{format(@credit)}|| #{format(@debit)}|| #{format(@balance)}"
  end

  private

  def format(item)
    "#{as_pounds(item)} " if item
  end

  def time
    @time.strftime('%d/%m/%Y')
  end
end
