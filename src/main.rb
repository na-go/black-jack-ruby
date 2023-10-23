require_relative './services/card/main'
require_relative './services/deck/main'
require_relative './services/hand/main'
require_relative './services/player/main'
require_relative './services/dealer/main'
require_relative './services/game/main'

module Blackjack
  def self.start
    game = Game.new
    game.deal_initial_cards
    display_initial_cards(game)
    game.player_turn
    game.dealer_turn unless game.player.hand.total_value > 21  # Skip dealer turn if player is busted
    game.display_result
  end

  def self.display_initial_cards(game)
    puts "ブラックジャックを開始します。"
    puts "あなたの引いたカードは#{game.player.hand.cards[0]}です。"
    puts "あなたの引いたカードは#{game.player.hand.cards[1]}です。"
    puts "ディーラーの引いたカードは#{game.dealer.hand.cards[0]}です。"
    puts "ディーラーの引いた2枚目のカードはわかりません。"
  end
end

Blackjack.start if __FILE__ == $0