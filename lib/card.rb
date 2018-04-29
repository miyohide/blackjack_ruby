class Card
  SUITS = %i(heart diamond club spade)
  NUMBERS = %W(A 1 2 3 4 5 6 7 8 9 10 J Q K)

  def self.generate_stock
    SUITS.product(NUMBERS).map { |suit, number| self.new(suit, number) }.shuffle
  end

  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def point
    case @number
    when 'A'
      1
    when 'J', 'Q', 'K'
      10
    else
      @number.to_i
    end
  end

  def to_s
    "#{@suit}の#{@number}"
  end
end
