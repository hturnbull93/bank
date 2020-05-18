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
  end
end