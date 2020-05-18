require 'transaction'

describe Transaction do
  describe '.display' do
    before(:each) do
      @testTimeFormatted = Time.now.strftime('%d/%m/%Y')
    end

    it 'has the time in the first column' do
      expect(subject.display).to eq "#{@testTimeFormatted} || || || "
    end

    it 'has the credit it is initialised with in the second column' do
      subject = Transaction.new(credit: 500)
      expect(subject.display).to eq "#{@testTimeFormatted} || 500 || || "
    end

    it 'has the debit it is initialised with in the second column' do
      subject = Transaction.new(debit: 500)
      expect(subject.display).to eq "#{@testTimeFormatted} || || 500 || "
    end

    it 'has the balance it is initialised with in the third column' do
      subject = Transaction.new(balance: 2000)
      expect(subject.display).to eq "#{@testTimeFormatted} || || || 2000"
    end
  end
end