class Luhn
  def self.valid?(input)
    number = input.gsub(' ', '')
    return false if number.chars.size <= 1 || number.match?(/\D/)

    sum_digits = number.chars.map(&:to_i).reverse.map.each_with_index do |num, index|
      if index.odd?
        num * 2 > 9 ? num * 2 - 9 : num * 2
      else
        num
      end
    end.sum

    (sum_digits % 10) == 0
  end
end
