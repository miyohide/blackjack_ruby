class Player
  attr_reader :cards

  def initialize(first, second)
    @cards = []
    @cards << first << second
    @stop = false
  end

  def add_card(card)
    @cards << card
  end

  def finished?
    total >= 21 || @stop
  end

  def total
    @cards.map(&:point).sum
  end

  def bust?
    total > 21
  end

  def bust_message
    "#{total}点でプレイヤーはbustしました。"
  end

  def total_message
    "現在のプレイヤーの得点は#{total}です。"
  end

  def stop
    @stop = true
  end
end