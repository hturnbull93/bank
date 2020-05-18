describe Transaction do
  it 'can be initialised with a Time' do
    testTime = Time.new(2020,05,18)
    subject = Transaction.new(time: testTime)
    expect(subject.display).to eq '18/05/2020 || || || '
  end
end