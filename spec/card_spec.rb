describe Card do
  describe ".generate_stock" do
    it "generate 52 cards" do
      cards = Card.generate_stock
      expect(cards.count).to eq 52
    end
  end

  describe "#point" do
    it "return valid point" do
      expect(Card.new(:heart, 'A').point).to eq 1
      expect(Card.new(:heart, '2').point).to eq 2
      expect(Card.new(:heart, 'J').point).to eq 10
      expect(Card.new(:heart, 'Q').point).to eq 10
      expect(Card.new(:heart, 'K').point).to eq 10
    end
  end
end
