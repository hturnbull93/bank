require 'transaction'

describe Transaction do
  it '.display' do
    testTimeFormatted = Time.now.strftime('%d/%m/%Y')
    expect(subject.display).to eq "#{testTimeFormatted} || || || "
  end
end