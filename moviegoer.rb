class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  FULL_PRICE = 15
  SENIORS_PRICE = 10
  SENIORS_START_AGE = 60
  ADULTS_START_AGE = 18

  attr_reader :age, :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    age >= SENIORS_START_AGE ? SENIORS_PRICE : FULL_PRICE
  end

  def watch_scary_movie?
    age >= ADULTS_START_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    member ? '🍿' : raise(NotMovieClubMemberError)
  end
end
