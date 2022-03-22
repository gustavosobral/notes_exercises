class Palindromes
  attr_reader :min_factor, :max_factor, :palindromes

  def initialize(min_factor: 1, max_factor:)
    @min_factor  = min_factor
    @max_factor  = max_factor
    @palindromes = []
  end

  def generate
    @palindromes = (min_factor..max_factor).to_a.repeated_combination(2).map do |combination|
      num = combination.inject(:*)
      if num.digits == num.digits.reverse
        Number.new(num, [combination])
      end
    end.compact.sort
  end

  def largest
    palindromes.last
  end

  def smallest
    palindromes.first
  end

  Number = Struct.new(:value, :factors) do
    def <=> (other)
      value <=> other.value
    end
  end
end
