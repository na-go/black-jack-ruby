require 'minitest/autorun'
require_relative './main.rb'
require_relative '../card/main'
require_relative '../hand/main'
require_relative '../deck/main'
require_relative '../player/main'
require_relative '../dealer/main'
require_relative '../game/main'
require 'stringio'

module Blackjack
  class GameTest < Minitest::Test
    def setup
      @game = Game.new
    end

    def test_deal_initial_cards
      @game.deal_initial_cards
      assert_equal 2, @game.player.hand.cards.count
      assert_equal 2, @game.dealer.hand.cards.count
      assert_equal 48, @game.deck.cards.count  # 52 - 4 = 48
    end

    def test_determine_winner
      @game.player.hand.add_card(Card.new('Hearts', '7'))
      @game.player.hand.add_card(Card.new('Clubs', '8'))
      @game.dealer.hand.add_card(Card.new('Diamonds', 'Q'))
      @game.dealer.hand.add_card(Card.new('Spades', '2'))
      assert_equal "Player", @game.determine_winner

      @game.player.hand.add_card(Card.new('Diamonds', '7'))  # player total becomes 22
      assert_equal "Dealer", @game.determine_winner

      @game.dealer.hand.add_card(Card.new('Hearts', 'K'))  # dealer total becomes 22
      assert_equal "Draw", @game.determine_winner
    end

    private

    # ユーザー入力を模擬する
    def simulate_user_input(input)
      $stdin = StringIO.new(input)
      yield
    ensure
      $stdin = STDIN
    end
  end
end