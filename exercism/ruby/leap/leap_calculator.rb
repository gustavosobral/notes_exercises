class LeapCalculator
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def leap?
    return false if (year % 4) != 0
    return false if (year % 100) == 0 && (year % 400) != 0

    true
  end
end
