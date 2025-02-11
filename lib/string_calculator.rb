class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    parse_input(numbers)
  end

  private

  def parse_input(numbers)
    numbers.to_i
  end
end
