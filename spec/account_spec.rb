# frozen_string_literal: true

require 'account'

describe Account do
  describe '.deposit' do
    it 'depositing 100 results in balance of 100' do
      expect(subject.deposit(100)).to eq '100.00 deposited. Current balance: 100.00'
    end
    
    it 'depositing 200 results in balance of 200' do
      expect(subject.deposit(200)).to eq '200.00 deposited. Current balance: 200.00'
    end
    
    it 'depositing 100 then 300 results in balance of 400' do
      subject.deposit(100)
      expect(subject.deposit(300)).to eq '300.00 deposited. Current balance: 400.00'
    end
  end
  
  describe '.withdraw (with 1000 deposited first)' do
    before(:each) do
      subject.deposit(1000)
    end
    
    it 'withdrawing 100 results in a balance of 900' do
      expect(subject.withdraw(100)).to eq '100.00 withdrawn. Current balance: 900.00'
    end
    
    it 'withdrawing 200 results in a balance of 800' do
      expect(subject.withdraw(200)).to eq '200.00 withdrawn. Current balance: 800.00'
    end
    
    it 'withdrawing 1500 throws Insuficcient funds' do
      expect(subject.withdraw(1500)).to eq 'Insufficient funds'
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
