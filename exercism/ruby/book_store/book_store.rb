class BookStore
  BOOK_PRICE = 8.0

  attr_reader :basket

  def initialize(basket)
    @basket = basket
  end

  def self.calculate_price(basket)
    new(basket).calculate_price
  end

  def calculate_price
    basket.sum { |_book| BOOK_PRICE }
  end
end
