# Ruby useful methods and concepts

Table of Contents
1. [Integer](#integer)
2. [String](#string)
3. [Enumerable](#enumerable)
4. [Array](#array)
5. [Flow Structures](#flow-structures)
6. [CSV](#csv)
7. [Files](#files)
8. [Command Line](#command-line)

## Integer

- `.digits` - Return the digits on a number (Order is reverse)
```ruby
=> 4292.digits
=> [2, 9, 2, 4]
```
- `.abs` - Return the absolute value of a number
```ruby
=> -10.abs
=> 10
```
- `.odd?` - Return true if number is odd
- `.even?` - Return true if number is even
- `.zero?` - Return true if number is zero

## String

- `.split` - Split string into array. Accept param of what to use for to split
```ruby
=> 'my-special-string'.split('-')
=> ["my", "special", "string"]
```
- `.chars` - Return the chars of a string
```ruby
=> 'gustavo'.chars
=> ["g", "u", "s", "t", "a", "v", "o"]
```
- `.capitalize` - First letter high
```ruby
=> 'gustavo'.capitalize
=> "Gustavo"
```
- `.upcase` - All letters high
```ruby
=> 'gustavo'.upcase
=> "GUSTAVO"
```
- `.downcase` - All letters low
```ruby
=> 'GUstaVO'.downcase
=> "gustavo"
```
- `.strip` - Remove white spaces
```ruby
=>'  Gustavo Sobral   '.strip
=> "Gustavo Sobral"
```
- `.tr` - Returns a copy of the string with the matching characters replaced
```ruby
=> 'Words to be replaced'.tr('aeo', '130')
=> "W0rds t0 b3 r3pl1c3d"
```
- `.start_with?` - Returns true if the string start with any of the parameters
```ruby
=> 'AB2 23'.start_with?('X', 'AB')
=> true
```

## Enumerable

- `.count` - Count
```ruby
=> [1,2,3,4,5].count { |i| i.odd? }
=> 3
```
- `.any?` - Return true if anything matches
- `.none?` - Return true if nothing matches
- `.select` - Return elements that matche
```ruby
=> [1,2,3,4,5].select { |i| i.odd? }
=> [1, 3, 5]
```
- `.all?` - Return true if all matches
- `.find` - Return first element that matches
- `.sum` - Sum all elements
- `.inject` - Accumulative function
```ruby
=> [2,3,10].inject(:*)
=> 60
```

## Array

- `.compact` - Remove all empty elements
- `.flatten` - Remove nesting
- `.transpose` - Transpose arrays and columns
```ruby
=> [[1,2],[3,4]].transpose
=> [[1, 3], [2, 4]]
```
- `.cycle` - Walk trough all the elements of the array N cycles. If no N is given, it loops forever
```ruby
=> [1,2,3].cycle(3).to_a
=> [1, 2, 3, 1, 2, 3, 1, 2, 3]
```
- `.permutation` - Yield all permutations possible of the array
```ruby
=> [1,2,3].permutation.to_a
=> [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
```
- `.combination` - Yield all combinations of length n of the array
```ruby
=> [1,2,3].combination(2).to_a
=> [[1, 2], [1, 3], [2, 3]]
```
- `.max` - Max value, accept param
```ruby
=> [1,2,3,4,5,6,7].max(2)
=> [7, 6]
```

## Flow Structures

Switch case:
```ruby
case year
when 0..2000
  'old'
when 2000..10000
  'new'
end
```

Variable arguments:
```ruby
def print_all(*args)
  ...
end
```

## Others

### CSV

```ruby
require 'csv'

csv = CSV.read('my_csv_file.csv', headers: true)

csv.class # CSV::Table
csv.first.class # CSV::Row
```

### Files

```ruby
File.read('my_file') # Reads the whole file at once, load everything in memory

f = File.open(filename)
f.each_byte # Read file byte by byte
```

### Command line

```ruby
#!/usr/bin/env ruby

require 'optparse'

puts ARGV

options = {}
parser = OptionParser.new do |opts|
  opts.on("-b", "--base [BASE]", String) do |base|
    options[:base] = base
  end
end

begin
  parser.parse!

  puts options
  puts ARGV
rescue OptionParser::InvalidArgument => e
  STDERR.puts "#{e.message.capitalize}. Run '#{File.basename($0)}' --help for details."
end
```

### Struct and OpenStruct

```ruby
Wheel = Struct.new(:rim, :tire) do
  def diamater
    rim + (tire * 2)
  end
end
```

```ruby
cat = OpenStruct.new(color: 'black')
cat.color
```
