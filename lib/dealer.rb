class Dealer
  attr_reader :cards

  def initialize(first, second)
    @cards = []
    @cards << first << second
  end

  def add_card(card)
    @cards << card
  end

  def finished?
    total >= 17
  end

  def total
    @cards.map(&:point).sum
  end

  def bust?
    total > 21
  end

  def bust_message
    "#{total}点でディーラーはbustしました。"
  end

  def total_message
    "現在のディーラーの得点は#{total}です。"
  end

end