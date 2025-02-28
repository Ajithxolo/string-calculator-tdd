require './lib/string_calculator'
RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }
  describe '#add' do
    context 'when the input is an empty string' do
      it 'returns zero' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when the input is a string with a single number' do
      it 'returns the same number' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when the input is a string of numbers separated by commas' do
      it 'returns the sum' do
        expect(calculator.add('1,2')).to eq(3)
      end
    end

    context 'when the input is a string of three-digit numbers separated by commas' do
      it 'returns the sum' do
        expect(calculator.add('1,123,999')).to eq(1123)
      end
    end

    context 'when the input is a string of multiple zeros separated by commas' do
      it 'returns zero' do
        expect(calculator.add('0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0')).to eq(0)
      end
    end

    context 'when the input is a string of numbers separated by commas and newline characters' do
      it 'returns the sum' do
        expect(calculator.add("11\n52,6")).to eq(69)
      end
    end

    context 'when the input is a string with a custom delimiter and two 3-digit numbers' do
      it 'returns the sum' do
        expect(calculator.add("//;\n100;129")).to eq(229)
      end
    end

    context 'when the input is a string with a custom delimiter and two numbers' do
      it 'returns the sum' do
        expect(calculator.add("//;\n10;20")).to eq(30)
      end
    end

    context 'when the input is a string with an arbitrary number of numbers' do
      it 'returns the sum' do
        numbers = Array.new(100) { rand(1..100) }
        string = numbers.join(',')
        expected_sum = numbers.sum
        result = calculator.add(string)
        expect(result).to eq(expected_sum)
      end
    end

    context 'when the input is a string with a single negative number' do
      it 'raises an exception' do
        expect{calculator.add("-1")}.to raise_error(described_class::NegativeNumberError, "negative numbers are not allowed -1")
      end
    end

    context 'when the input is a string with multiple negative numbers' do
      it 'raises an exception' do
        expect{calculator.add("-1,-2,-3")}.to raise_error(described_class::NegativeNumberError, "negative numbers are not allowed -1, -2, -3")
      end
    end

    context 'when input is a string with special conditions' do
      it 'returns the sum excluding numbers greater than 1000' do
        result = calculator.add('2,3,1001')
        expect(result).to eq(5)
      end
    end

    context 'when the input is a string with a complex custom delimiter and multiple numbers' do
      it 'returns the sum' do
        result = calculator.add('//[***]\n1***2***3')
        expect(result).to eq(6)
      end
    end
  end
end
