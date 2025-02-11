class StringCalculator
  class NegativeNumberError < StandardError
    def initialize(numbers)
      super("negative numbers are not allowed #{numbers.join(', ')}")
    end
  end

  def add(numbers)
    return 0 if numbers.empty?
    delimiter, numbers = parse_input(numbers)
    validate_negatives!(numbers) if numbers.include?("-")
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

  def validate_negatives!(numbers)
    negative_numbers = numbers.scan(/-\d+/)
    raise NegativeNumberError, negative_numbers if negative_numbers.any?
  end
end
