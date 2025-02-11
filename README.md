# String Calculator
The String Calculator is a simple Ruby application that provides a method to add numbers provided as strings.
## Features
- **Add Method**: The `add` method accepts a string of numbers and returns their sum.
- **Multiple Delimiters**: The numbers in the string can be separated by commas or newline characters.
- **Custom Delimiters**: The `add` method also supports custom delimiters. The delimiter is specified at the beginning of the string, in the format `//[delimiter]\n`. For example, the string `//;\n1;2` will return 3.
- **Ignore Large Numbers**: The `add` method ignores numbers greater than 1000.
- **Negative Number Handling**: If the string contains negative numbers, the `add` method raises an exception with a message indicating which numbers were negative.
- **Any Length Delimiters**: The `add` method supports delimiters of any length.
## Usage
1. **Create an Instance**: First, create a new instance of the `StringCalculator` class:
```ruby
calculator = StringCalculator.new
```
2. **Call the Add Method**: Then, call the add method with a string of numbers:
```
result = calculator.add('1,2,3')
```
The add method will return the sum of the numbers in the string.
Running Tests
This application includes a suite of tests written with RSpec. To run the tests, navigate to the application directory in your terminal and run the following command:
```
rspec
```