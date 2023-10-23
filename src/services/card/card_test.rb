require 'minitest/autorun'
require_relative './main'

module Blackjack
  class CardTest < Minitest::Test
    def test_to_s
      card = Card.new('Hearts', 'K')
      assert_equal 'K of Hearts', card.to_s
    end

    def test_point_value
      card1 = Card.new('Hearts', 'K')
      assert_equal 10, card1.point_value

      card2 = Card.new('Diamonds', 'A')
      assert_equal 1, card2.point_value

      card3 = Card.new('Clubs', '5')
      assert_equal 5, card3.point_value
    end
  end
end
