# frozen_string_literal: true

require 'account'

describe 'Account Feature Test' do
  it 'deposit 1000, 2000 then withdraw 500' do
    time1 = Time.new(2012, 1, 10, 12)
    time2 = Time.new(2012, 1, 13, 12)
    time3 = Time.new(2012, 1, 14, 12)

    subject = Account.new

    allow(Time).to receive(:now).and_return(time1)
    subject.deposit(1000)

    allow(Time).to receive(:now).and_return(time2)
    subject.deposit(2000)

    allow(Time).to receive(:now).and_return(time3)
    subject.withdraw(500)

    statement = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00 \n13/01/2012 || 2000.00 || || 3000.00 \n10/01/2012 || 1000.00 || || 1000.00 "

    expect{ subject.statement }.to output(/#{statement}/m).to_stdout
  end

  it 'deposit 2000, 3000 then withdraw 1500' do
    time1 = Time.new(2012, 1, 10, 12)
    time2 = Time.new(2012, 1, 13, 12)
    time3 = Time.new(2012, 1, 14, 12)

    subject = Account.new

    allow(Time).to receive(:now).and_return(time1)
    subject.deposit(2000)

    allow(Time).to receive(:now).and_return(time2)
    subject.deposit(3000)

    allow(Time).to receive(:now).and_return(time3)
    subject.withdraw(1500)

    statement = "date || credit || debit || balance\n14/01/2012 || || 1500.00 || 3500.00 \n13/01/2012 || 3000.00 || || 5000.00 \n10/01/2012 || 2000.00 || || 2000.00 "

    expect{ subject.statement }.to output(/#{statement}/m).to_stdout
  end
end
