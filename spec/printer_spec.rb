require 'printer'

describe Printer do
  describe '.print' do
    it '"Hello World" prints "Hello World" with newline' do
      expect { subject.print('Hello World') }.to output("Hello World\n").to_stdout
    end

    it '"Hi There" prints "Hi There" with newline' do
      expect { subject.print('Hi There') }.to output("Hi There\n").to_stdout
    end

    it 'passing an array prints each element on a new line' do
      array = ['Hello', 'World']
      result = "Hello\nWorld\n"
      expect { subject.print(array) }.to output(result).to_stdout
    end
  end
end