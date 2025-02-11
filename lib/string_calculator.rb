class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiter, numbers = parse_input(numbers)
    calculate_sum(numbers, delimiter)
  end

  private

  def parse_input(numbers)
    return [",", numbers] unless numbers.start_with?("//")
    delimiter, numbers = numbers.split("\n")
    parsed_delimiter = delimiter[2..-1]
    [parsed_delimiter, numbers]
  end

  def calculate_sum(numbers, delimiter)
    regex = /#{Regexp.escape(delimiter)}|\n/
    numbers.split(regex).map(&:to_i).sum 
  end
end
