class Affine
  M                     = 26
  ASCII_TO_INDEX_FACTOR = 97
  
  attr_reader :a, :b

  def initialize(a, b)
    raise ArgumentError unless coprime?(a, M)

    @a = a
    @b = b
  end

  def encode(text)
    text.scan(/\w+/).join.downcase.chars.map do |char|
      if char.match?(/\d/)
        char.ord
      else
        char_index = char.ord - ASCII_TO_INDEX_FACTOR
        ((a * char_index + b) % M) + ASCII_TO_INDEX_FACTOR
      end
    end.each_slice(5).map { |word| word.pack('c*') }.join(' ')
  end

  def decode(text)
    mmi_a = mod_inverse(a)
    text.scan(/\w+/).join.downcase.chars.map do |char|
      if char.match?(/\d/)
        char.ord
      else
        char_index = char.ord - ASCII_TO_INDEX_FACTOR
        (mmi_a * (char_index - b) % M) + ASCII_TO_INDEX_FACTOR
      end
    end.pack('c*')
  end

  private

  def mod_inverse(a)
    (1..M).select{ |i| a * i % M == 1 }.first
  end

  def coprime?(num1, num2)
    factors(num1) & factors(num2) == [1]
  end

  def factors(num)
     (1..num).select { |i| num % i == 0 }
  end
end
