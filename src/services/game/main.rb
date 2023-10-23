module Blackjack
  class Game
    attr_reader :player, :dealer, :deck

    def initialize
      @player = Player.new
      @dealer = Dealer.new
      @deck = Deck.new
    end

    # 初期カードを配る
    def deal_initial_cards
      2.times do
        @player.hand.add_card(@deck.draw)
        @dealer.hand.add_card(@deck.draw)
      end
    end

    # プレイヤーのターンを処理する
    def player_turn
      while @player.decide
        @player.hand.add_card(@deck.draw)
      end
    end

    # ディーラーのターンを処理する
    def dealer_turn
      while @dealer.decide
        @dealer.hand.add_card(@deck.draw)
      end
    end

    # 勝者を決定する
    def determine_winner
      player_total = @player.hand.total_value
      dealer_total = @dealer.hand.total_value

      return 'Draw' if player_total == dealer_total
      player_total > dealer_total && player_total <= 21 ? 'Player' : 'Dealer'
    end

    # 結果を表示する
    def display_result
      winner = determine_winner
      puts "あなたの得点は#{@player.hand.total_value}です。"
      puts "ディーラーの得点は#{@dealer.hand.total_value}です。"
      puts winner == 'Draw' ? "It's a draw!" : "#{winner} wins!"
    end
  end
end
