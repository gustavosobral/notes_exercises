class ResistorColorTrio
  class InvalidColorError < ArgumentError; end

  BAND = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }

  attr_reader :colors

  def initialize(colors)
    @colors = colors
  end

  def label
    "Resistor value: #{value}"
  end

  private

  def value
    if resistance > 1000
      "#{resistance / 1000} kiloohms"
    else
      "#{resistance} ohms"
    end
  end

  def resistance
    @resistance ||= begin
      digits = colors.map { |color| color_to_number(color) }
      digits[0..1].join.to_i * (10 ** digits[2])
    end
  end

  def color_to_number(color_code)
    if BAND[color_code].nil?
      raise InvalidColorError.new "#{color_code} is an invalid color. Valid colors are: #{BAND.keys}"
    end

    BAND[color_code]
  end
end
