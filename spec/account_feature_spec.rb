# frozen_string_literal: true

require 'account'

describe 'Account Feature Test' do
  it 'deposit 1000, 2000 then withdraw 500' do
    time_one = Time.new(2012, 1, 10, 12)
    time_two = Time.new(2012, 1, 13, 12)
    time_three = Time.new(2012, 1, 14, 12)

    subject = Account.new

    allow(Time).to receive(:now).and_return(time_one)
    subject.deposit(1000)

    allow(Time).to receive(:now).and_return(time_two)
    subject.deposit(2000)

    allow(Time).to receive(:now).and_return(time_three)
    subject.withdraw(500)

    statement_header  = "date || credit || debit || balance "
    transaction_one   = /14\/01\/2012 \|\| \|\| 500.00 \|\| 2500.00 /
    transaction_two   = /13\/01\/2012 \|\| 2000.00 \|\| \|\| 3000.00 /
    transaction_three = /10\/01\/2012 \|\| 1000.00 \|\| \|\| 1000.00 /

    expect{ subject.statement }.to output(/#{statement_header}/m).to_stdout
    expect{ subject.statement }.to output(transaction_one).to_stdout
    expect{ subject.statement }.to output(transaction_two).to_stdout
    expect{ subject.statement }.to output(transaction_three).to_stdout
  end

  it 'deposit 2000, 3000 then withdraw 1500' do
    time_one = Time.new(2012, 1, 10, 12)
    time_two = Time.new(2012, 1, 13, 12)
    time_three = Time.new(2012, 1, 14, 12)

    subject = Account.new

    allow(Time).to receive(:now).and_return(time_one)
    subject.deposit(2000)

    allow(Time).to receive(:now).and_return(time_two)
    subject.deposit(3000)

    allow(Time).to receive(:now).and_return(time_three)
    subject.withdraw(1500)

    statement_header  = "date || credit || debit || balance "
    transaction_one   = /14\/01\/2012 \|\| \|\| 1500.00 \|\| 3500.00 /
    transaction_two   = /13\/01\/2012 \|\| 3000.00 \|\| \|\| 5000.00 /
    transaction_three = /10\/01\/2012 \|\| 2000.00 \|\| \|\| 2000.00 /

    expect{ subject.statement }.to output(/#{statement_header}/m).to_stdout
    expect{ subject.statement }.to output(transaction_one).to_stdout
    expect{ subject.statement }.to output(transaction_two).to_stdout
    expect{ subject.statement }.to output(transaction_three).to_stdout
  end
end
