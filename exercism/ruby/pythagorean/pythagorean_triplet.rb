class Triplet
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def self.where(max_factor:, min_factor: 1, sum: nil)
    (min_factor..(max_factor - 2)).map do |a|
      ((a + 1)..(max_factor - 1)).map do |b|
        ((a + 2)..(max_factor)).map do |c|
          triplet = Triplet.new(a, b, c)
          triplet if triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
        end
      end.flatten
    end.flatten.compact
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    return true if (a**2 + b**2 == c**2) && a < b && b < c

    false
  end
end
