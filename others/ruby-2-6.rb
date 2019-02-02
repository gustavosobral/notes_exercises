# Composing procs and lambdas

square = -> (n) { n * n }
add_2  = -> (n) { n + 2 }

(square >> add_2).call(5) # => 27
(square << add_2).call(5) # => 49

# Kernel then

API_URL = 'https://myapi.com/api/v1'
isbn = '978-1-93778-549-9'
isbn.gsub('-', '')
  .then { |isbn| "#{API_URL}/q=isbn:#{isbn}" } # => https://myapi.com/api/v1/q=isbn:9781937785499


# Merge multiple hashes

foo = { a: 1 }
bar = { b: 2 }
baz = { c: 3 }

foo.merge(bar, baz) # => { a: 1, b: 2, c: 3 }
