class Team
  attr_accessor :name, :wins, :loses, :draws, :points, :matches

  def initialize(name)
    @name  = name
    @wins  = 0
    @loses = 0
    @draws = 0
  end

  def win
    @wins += 1
  end

  def loss
    @loses += 1
  end

  def draw
    @draws += 1
  end

  def matches
    @wins + @loses + @draws
  end

  def points
    @wins * 3 + @draws
  end

  def to_s
    "#{formatted_name} |  #{matches} |  #{wins} |  #{draws} |  #{loses} |  #{points}"
  end

  def <=>(other)
    if points == other.points
      -(name <=> other.name)
    else
      points <=> other.points
    end
  end

  private

  def formatted_name
    '%-30s' % name
  end
end
