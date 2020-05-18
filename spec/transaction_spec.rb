# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '.display' do
    it 'has the time in the first column' do
      @test_time_format = Time.now.strftime('%d/%m/%Y')

      expect(subject.display).to eq "#{@test_time_format} || || || "
    end
    
    it 'has the credit it is initialised with in the second column' do
      @test_time_format = Time.now.strftime('%d/%m/%Y')
      subject = described_class.new(credit: 500)

      expect(subject.display).to eq "#{@test_time_format} || 500.00 || || "
    end
    
    it 'has the debit it is initialised with in the second column' do
      @test_time_format = Time.now.strftime('%d/%m/%Y')
      subject = described_class.new(debit: 500)

      expect(subject.display).to eq "#{@test_time_format} || || 500.00 || "
    end

    it 'has the balance it is initialised with in the third column' do
      @test_time_format = Time.now.strftime('%d/%m/%Y')
      subject = described_class.new(balance: 2000)

      expect(subject.display).to eq "#{@test_time_format} || || || 2000.00 "
    end
    
    it 'displays time, credit, debit, balance all at once' do
      @test_time_format = Time.now.strftime('%d/%m/%Y')
      subject = described_class.new(credit: 200, debit: 100, balance: 2000)

      expect(subject.display).to eq "#{@test_time_format} || 200.00 || 100.00 || 2000.00 "
    end
  end
end
