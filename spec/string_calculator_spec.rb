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
  end
end
