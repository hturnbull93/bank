require 'account'

describe Account do
  it 'is initialised with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '.deposit' do
    it 'passing 100 results in balance of 100' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end

    it 'passing 200 results in balance of 200' do
      subject.deposit(200)
      expect(subject.balance).to eq 200
    end

    it 'passing 100 then 300 results in balance of 400' do
      subject.deposit(100)
      subject.deposit(300)
      expect(subject.balance).to eq 400
    end
  end

  describe '.withdraw (with 1000 deposited first)' do
    before(:each) do
      subject.deposit(1000)
    end

    it 'passing 100 results in a balance of 900' do
      subject.withdraw(100)
      expect(subject.balance).to eq 900
    end

    it 'passing 200 results in a balance of 800' do
      subject.withdraw(200)
      expect(subject.balance).to eq 800
    end
  end
end