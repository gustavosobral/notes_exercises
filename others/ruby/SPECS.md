## MiniTest

Gemfile:
```
source 'https://rubygems.org'

gem 'minitest'
```

Example test file:

```ruby
require 'minitest/autorun'

require_relative 'leap_calculator'

class LeapCalculatorTest < Minitest::Test
  def test_if_1997_is_not_leap
    # skip
    assert_equal false, LeapCalculator.new(1997).leap?
  end
end
```

Command line: `$ bundle exec ruby tournament_test.rb`

## RSpec

Gemfile:
```
source 'https://rubygems.org'

gem 'rspec'
gem 'rspec-core'
```

Example test file:

```ruby
require_relative 'leap_calculator'

RSpec.describe LeapCalculator do
  it 'returns false' do
    expect(LeapCalculator.new(1997).leap?).to eq(false)
  end
end
```

Command line: `$ bundle exec rspec leap_calculator_spec.rb`
