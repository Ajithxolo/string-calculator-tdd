require './lib/string_calculator'
RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }
  describe '#add' do
    context 'when the input is an empty string' do
      it 'returns zero' do
        expect(calculator.add('')).to eq(0)
      end
    end
  end
end
