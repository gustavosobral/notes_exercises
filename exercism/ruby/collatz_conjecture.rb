class CollatzConjecture
  def self.steps(n, step = 0)
    raise ArgumentError if n < 1
    return step if n == 1

    if n.even?
      steps(n / 2, step + 1)
    else
      steps(3 * n + 1, step + 1)
    end
  end
end
