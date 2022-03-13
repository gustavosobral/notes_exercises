## MiniTest

Gemfile:
```
source 'https://rubygems.org'

gem 'minitest'
```

Example test file:

```ruby
require 'minitest/autorun'

require_relative 'tournament'

class TournamentTest < Minitest::Test
  def test_just_the_header_if_no_input
    # skip
    input = <<~INPUT

    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY
    assert_equal expected, Tournament.tally(input)
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
