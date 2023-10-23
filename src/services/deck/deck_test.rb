require 'minitest/autorun'
require_relative './main.rb'

module Blackjack
  class DeckTest < Minitest::Test
    def test_initialization_and_draw
      deck = Deck.new
      assert_equal 52, deck.cards.length

      card = deck.draw
      assert_kind_of Card, card
      assert_equal 51, deck.cards.length
    end

    def test_shuffle
      deck = Deck.new
      original_cards = deck.cards.dup
      deck.shuffle
      refute_equal original_cards, deck.cards
    end

    def test_all_draw
      deck = Deck.new
      drawn_cards = []
      52.times do
        card = deck.draw
        refute_includes drawn_cards, card
        drawn_cards << card
      end
    end

  end
end
