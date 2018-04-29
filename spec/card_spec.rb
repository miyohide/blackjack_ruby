describe Card do
  describe ".generate_stock" do
    it "generate 52 cards" do
      cards = Card.generate_stock
      expect(cards.count).to eq 52
    end
  end
end
