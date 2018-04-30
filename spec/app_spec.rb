describe App do
  describe "#run" do
    context "dealer win" do
      context "player bust" do
        let(:cards) do
          [
            Card.new(:spade, '10'), Card.new(:spade, 'J'),   # playerの手札
            Card.new(:heart, '2'), Card.new(:heart, '3'),    # dealerの手札
            Card.new(:spade, '2')
          ]
        end

        let(:answer) do
          <<-ANSWER
ブラックジャックゲームにようこそ
あなたのカードはspadeの10です。
あなたのカードはspadeのJです。
ディーラーのカードはheartの2です
ディーラーの2枚目のカードは分かりません
現在のプレイヤーの得点は20です。
カードを引きますか？
あなたのカードはspadeの2です。
22点でプレイヤーはbustしました。
ディーラーが勝ちました。
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

      context "dealer total > player total" do
        let(:cards) do
          [
            Card.new(:spade, '3'), Card.new(:spade, 'J'),   # playerの手札
            Card.new(:heart, '2'), Card.new(:heart, '3'),    # dealerの手札
            Card.new(:spade, 'A'),  # playerの手札
            Card.new(:heart, 'K'), Card.new(:heart, '4')  # dealerの手札
          ]
        end

        let(:answer) do
          <<-ANSWER
ブラックジャックゲームにようこそ
あなたのカードはspadeの3です。
あなたのカードはspadeのJです。
ディーラーのカードはheartの2です
ディーラーの2枚目のカードは分かりません
現在のプレイヤーの得点は13です。
カードを引きますか？
あなたのカードはspadeのAです。
現在のプレイヤーの得点は14です。
カードを引きますか？
現在のディーラーの得点は5です。
ディーラーのカードはheartのKです
現在のディーラーの得点は15です。
ディーラーのカードはheartの4です
ディーラーが勝ちました。
さようなら。また遊んでね。
          ANSWER
        end

        before do
          allow(Card).to receive(:generate_stock).and_return(cards)
        end

        example do
          app = App.new
          allow(app).to receive(:answer_yes?).and_return(true, false)
          expect { app.run }.to output(answer).to_stdout
        end        
      end
    end

    context "player win" do
      context "dealer bust" do
        let(:cards) do
          [
            Card.new(:spade, '3'), Card.new(:spade, 'J'),   # playerの手札
            Card.new(:heart, '2'), Card.new(:heart, '3'),    # dealerの手札
            Card.new(:spade, '2'),  # playerの手札
            Card.new(:heart, '10'), Card.new(:heart, 'J')  # dealerの手札
          ]
        end

        let(:answer) do
          <<-ANSWER
ブラックジャックゲームにようこそ
あなたのカードはspadeの3です。
あなたのカードはspadeのJです。
ディーラーのカードはheartの2です
ディーラーの2枚目のカードは分かりません
現在のプレイヤーの得点は13です。
カードを引きますか？
あなたのカードはspadeの2です。
現在のプレイヤーの得点は15です。
カードを引きますか？
現在のディーラーの得点は5です。
ディーラーのカードはheartの10です
現在のディーラーの得点は15です。
ディーラーのカードはheartのJです
25点でディーラーはbustしました。
プレイヤーが勝ちました。
さようなら。また遊んでね。
          ANSWER
        end

        before do
          allow(Card).to receive(:generate_stock).and_return(cards)
        end

        example do
          app = App.new
          allow(app).to receive(:answer_yes?).and_return(true, false)
          expect { app.run }.to output(answer).to_stdout
        end
      end

      context "player total > dealer total" do
        let(:cards) do
          [
            Card.new(:spade, '3'), Card.new(:spade, 'J'),   # playerの手札
            Card.new(:heart, '2'), Card.new(:heart, '3'),    # dealerの手札
            Card.new(:spade, '7'),  # playerの手札
            Card.new(:heart, '10'), Card.new(:heart, '4')  # dealerの手札
          ]
        end

        let(:answer) do
          <<-ANSWER
ブラックジャックゲームにようこそ
あなたのカードはspadeの3です。
あなたのカードはspadeのJです。
ディーラーのカードはheartの2です
ディーラーの2枚目のカードは分かりません
現在のプレイヤーの得点は13です。
カードを引きますか？
あなたのカードはspadeの7です。
現在のプレイヤーの得点は20です。
カードを引きますか？
現在のディーラーの得点は5です。
ディーラーのカードはheartの10です
現在のディーラーの得点は15です。
ディーラーのカードはheartの4です
プレイヤーが勝ちました。
さようなら。また遊んでね。
          ANSWER
        end

        before do
          allow(Card).to receive(:generate_stock).and_return(cards)
        end

        example do
          app = App.new
          allow(app).to receive(:answer_yes?).and_return(true, false)
          expect { app.run }.to output(answer).to_stdout
        end
      end
    end
  end
end
