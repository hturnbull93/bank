# frozen_string_literal: true

require 'account'

describe Account do
  it 'is initialised with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '.deposit' do
    it 'depositing 100 results in balance of 100' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end

    it 'depositing 200 results in balance of 200' do
      subject.deposit(200)
      expect(subject.balance).to eq 200
    end

    it 'depositing 100 then 300 results in balance of 400' do
      subject.deposit(100)
      subject.deposit(300)
      expect(subject.balance).to eq 400
    end
  end

  describe '.withdraw (with 1000 deposited first)' do
    before(:each) do
      subject.deposit(1000)
    end

    it 'withdrawing 100 results in a balance of 900' do
      subject.withdraw(100)
      expect(subject.balance).to eq 900
    end

    it 'withdrawing 200 results in a balance of 800' do
      subject.withdraw(200)
      expect(subject.balance).to eq 800
    end

    it 'withdrawing 1500 throws Insuficcient funds' do
      expect { subject.withdraw(1500) }.to raise_error('Insufficient funds')
    end
  end

  describe 'uses Transaction class' do
    let(:transaction) { double(:transaction) }
    let(:transaction_class) { double(:transaction_class, new: transaction) }

    subject { Account.new(transaction_class) }

    it 'deposit calls for a new transaction with the credit amount and balance' do
      expect(transaction_class).to receive(:new).with(credit: 100, balance: 100)
      subject.deposit(100)
    end

    it 'withdraw calls for a new transaction with the debit amount and balance' do
      subject.deposit(1000)
      expect(transaction_class).to receive(:new).with(debit: 100, balance: 900)
      subject.withdraw(100)
    end
  end
end
