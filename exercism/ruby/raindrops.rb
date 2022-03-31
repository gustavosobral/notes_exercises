class Raindrops
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.convert(number)
    new(number).convert
  end

  def convert
    raindrops = calculate_raindrops

    return raindrops unless raindrops.empty?

    number.to_s
  end

  private

  def calculate_raindrops
    result = []

    result << 'Pling' if number % 3 == 0
    result << 'Plang' if number % 5 == 0
    result << 'Plong' if number % 7 == 0

    result.join
  end
end
