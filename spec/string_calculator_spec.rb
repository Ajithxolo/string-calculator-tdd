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
  end
end
