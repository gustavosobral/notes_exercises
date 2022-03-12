class SumOfMultiples
  attr_reader :multiples

  def initialize(*params)
    @multiples = params
  end

  def to(limit)
    (1..(limit - 1)).map do |number|
      number if multiples.any? { |multiple| number % multiple == 0 }
    end.compact.sum
  end
end
