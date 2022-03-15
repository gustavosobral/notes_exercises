class Robot
  BEARINGS = %i[east west north south]

  attr_reader :bearing, :x, :y

  def orient(bearing)
    raise ArgumentError unless BEARINGS.include?(bearing)

    @bearing = bearing
  end

  def turn_right
    if bearing == :east
      @bearing = :south
    elsif bearing == :south
      @bearing = :west
    elsif bearing == :west
      @bearing = :north
    elsif bearing == :north
      @bearing = :east
    end
  end

  def turn_left
    if bearing == :east
      @bearing = :north
    elsif bearing == :south
      @bearing = :east
    elsif bearing == :west
      @bearing = :south
    elsif bearing == :north
      @bearing = :west
    end
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def coordinates
    [x, y]
  end

  def advance
    if bearing == :north
      @y += 1
    elsif bearing == :south
      @y -= 1
    elsif bearing == :west
      @x -= 1
    elsif bearing == :east
      @x += 1
    end
  end
end

class Simulator
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instruction_codes)
    commands = instructions(instruction_codes)
    commands.each { |command| robot.send(command) }
  end

  def instructions(codes)
    codes.chars.map do |char|
      if char == 'L'
        :turn_left
      elsif char == 'R'
        :turn_right
      elsif char == 'A'
        :advance
      end
    end
  end
end
