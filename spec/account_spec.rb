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
  end
end