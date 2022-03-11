# Ruby important functions and concepts

## Integer

- `.digits` - Digits on a number
- `.abs` - Absolute value
- `.odd?` - Return true if is odd
- `.even?` - Return true if is even
- `.zero?` - Return true if number is zero

## String

- `.split` - Split string into array
- `.chars` - Chars of string
- `.capitalize` - First letter high
- `.upcase` - All letters high
- `.downcase` - All letters low
- `.strip` - Remove white spaces

## Enumerable

- `.count` - Count
- `.any?` - Return true if anything matches
- `.none?` - Return true if nothing matches
- `.select?` - Selects what matches
- `.all?` - Return true if all matches
- `.find` - Return first element that matches
- `.sum` - Sum all elements

## Array

- `.compact` - Remove all empty elements
- `.flatten` - Remove nesting
- `.transpose` - Transpose arrays and columns

## Flow Structures

```ruby
case year
when 0..2000
  'old'
when 2000..10000
  'new'
end
```

## TODO:

- Procs
- Blocks / Yield
- MiniTest
