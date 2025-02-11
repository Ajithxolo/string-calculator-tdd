class StringCalculator
  class NegativeNumberError < StandardError
    def initialize(numbers)
      super("negative numbers are not allowed #{numbers.join(', ')}")
    end
  end

  def add(numbers)
    return 0 if numbers.empty?
    delimiter, numbers = parse_input(numbers)
    validate_negatives!(numbers)
    calculate_sum(numbers, delimiter)
  end

  private

  def parse_input(numbers)
    return [",", numbers] unless numbers.start_with?("//")
    delimiter, numbers = numbers.gsub("\\n", "\n").split("\n")
    has_custom_delimiter = delimiter.match?(/\[.*\]/)
    parsed_delimiter = has_custom_delimiter ? delimiter[3..-2] : delimiter[2..-1]
    [parsed_delimiter, numbers]
  end

  def calculate_sum(numbers, delimiter)
    regex = /#{Regexp.escape(delimiter)}|\n/
    parsed_numbers = numbers.split(regex).map(&:to_i)
    numbers = reject_large_numbers(parsed_numbers).sum 
  end

  def validate_negatives!(numbers)
    negative_numbers = numbers.scan(/-\d+/)
    raise NegativeNumberError, negative_numbers if negative_numbers.any?
  end

  def reject_large_numbers(numbers)
    numbers.reject { |num| num > 1000 }
  end
end
