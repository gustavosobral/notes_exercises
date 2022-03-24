class Triangle
  def initialize(sides)
    @x = sides[0]
    @y = sides[1]
    @z = sides[2]
  end

  def equilateral?
    return false if @x == 0

    @x == @y && @y == @z
  end

  def isosceles?
    return false unless respects_inequality?

    @x == @y || @x == @z || @y == @z
  end

  def scalene?
    return false unless respects_inequality?

    @x != @y && @x != @z && @y != @z
  end

  private

  def respects_inequality?
    (@x + @y >= @z) && (@x + @z >= @y) && (@y + @z >= @x)
  end
end
