require_relative "./card"
require_relative "./player"
require_relative "./dealer"

class App
  def self.run
    App.new.run
  end

  def run
    puts "ブラックジャックゲームにようこそ"

    @cards = Card.generate_stock
    @player = Player.new(*@cards.shift(2))
    @dealer = Dealer.new(*@cards.shift(2))

    @player.cards.each do |card|
      puts player_card(card)
    end

    puts dealer_card(@dealer.cards[0])
    puts "ディーラーの2枚目のカードは分かりません"

    play_game

    puts "さようなら。また遊んでね。"
  end
  
  def player_card(card)
    "あなたのカードは#{card}です"
  end

  def dealer_card(card)
    "ディーラーのカードは#{card}です"
  end

  def play_game
    until @player.finished?
      player_add_or_stop
    end

    if @player.bust?
      puts @player.bust_message
      return :lose
    end

    until @dealer.finished?
      dealer_add
    end

    if @dealer.bust?
      puts @dealer.bust_message
      return :win
    end

    if @player.total > @dealer.total
      return :win
    elsif @player.total < @dealer.total
      return :lose
    else
      return :draw
    end
  end

  def player_add_or_stop
    puts @player.total_message
    puts "カードを引きますか？"
    if answer_yes?
      card = @cards.shift
      @player.add_card(card)
      puts player_card(card)
    else
      @player.stop
    end
  end

  def dealer_add
    puts @dealer.total_message
    card = @cards.shift
    @dealer.add_card(card)
    puts dealer_card(card)
  end

  def answer_yes?
    input = nil
    loop do
      print "y/n: >"
      input = gets.chomp.downcase
      break if %w(y n).include?(input)
    end
    input == "y"
  end
end

if __FILE__ == $0
  App.run
end
