require 'minitest/autorun'
require_relative '../card/main'
require_relative './main'

module Blackjack
  class HandTest < Minitest::Test
    def setup
      @hand = Hand.new
      @card1 = Card.new('Hearts', '7')
      @card2 = Card.new('Clubs', '8')
      @card3 = Card.new('Spades', '5')
    end

    def test_add_card
      @hand.add_card(@card1)
      assert_equal 1, @hand.cards.length
      assert_equal @card1, @hand.cards.first

      @hand.add_card(@card2)
      assert_equal 2, @hand.cards.length
      assert_equal @card2, @hand.cards.last
    end

    def test_total_value
      @hand.add_card(@card1)
      @hand.add_card(@card2)
      assert_equal 15, @hand.total_value

      @hand.add_card(@card3)
      assert_equal 20, @hand.total_value

      ace_card = Card.new('Diamonds', 'A')
      @hand.add_card(ace_card)
      assert_equal 21, @hand.total_value  # Aは1点として扱われる

      another_ace_card = Card.new('Diamonds', 'A')
      @hand.add_card(another_ace_card)
      assert_equal 22, @hand.total_value  # 2枚目のAは1点として扱われる
    end
  end
end
