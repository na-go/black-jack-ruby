require 'minitest/autorun'
require_relative './main.rb'
require_relative '../card/main'
require_relative '../hand/main'

module Blackjack
  class DealerTest < Minitest::Test
    def setup
      @dealer = Dealer.new
      @card1 = Card.new('Hearts', '7')
      @card2 = Card.new('Clubs', '8')
    end

    def test_decide
      @dealer.hand.add_card(@card1)
      assert @dealer.decide  # hand total is 7, so should decide to draw

      @dealer.hand.add_card(@card2)
      assert @dealer.decide  # hand total is 15, so should decide to draw

      @dealer.hand.add_card(Card.new('Diamonds', '2'))
      refute @dealer.decide  # hand total is 17, so should not decide to draw
    end
  end
end