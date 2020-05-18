require 'printer'

describe Printer do
  describe '.print' do
    it '"Hello World" prints "Hello World" with newline' do
      expect { subject.print('Hello World') }.to output("Hello World\n").to_stdout
    end
      
  end
end