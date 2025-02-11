class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    calculate_sum(parse_input(numbers))
  end

  private

  def parse_input(numbers)
    numbers.split(',').map(&:to_i)
  end

  def calculate_sum(numbers)
    numbers.sum
  end
end
