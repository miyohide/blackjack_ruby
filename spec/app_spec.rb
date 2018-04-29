describe App do
  describe "#run" do
    context "dealer win" do
      context "player bust" do
        let(:cards) do
          [
            Card.new(:spade, '10'), Card.new(:spade, 'J'),
            Card.new(:heart, '2'), Card.new(:heart, '3'),
            Card.new(:spade, '2')
          ]
        end

        let(:answer) do
          <<-ANSWER
ブラックジャックゲームにようこそ
あなたのカードはspadeの10です
あなたのカードはspadeのJです
ディーラーのカードはheartの2です
ディーラーの2枚目のカードは分かりません
現在のプレイヤーの得点は20です。
カードを引きますか？
あなたのカードはspadeの2です
22点でプレイヤーはbustしました。
さようなら。また遊んでね。
          ANSWER
        end

        before do
          allow(Card).to receive(:generate_stock).and_return(cards)
        end

        example do
          app = App.new
          allow(app).to receive(:answer_yes?).and_return(true)
          expect { app.run }.to output(answer).to_stdout
        end
      end
    end
  end
end
