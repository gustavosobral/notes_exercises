class Grains
  def self.square(square)
    raise ArgumentError if square < 1 || square > 64

    2.pow(square - 1)
  end

  def self.total
    2.pow(64) - 1
  end
end
