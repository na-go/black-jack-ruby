module Blackjack
  class Deck
    attr_reader :cards

    def initialize
      @cards = generate_deck
      shuffle
    end

    # デッキをシャッフルする
    def shuffle
      @cards.shuffle!
    end

    # カードを1枚引く
    def draw
      @cards.pop
    end

    private

    # 52枚のカードで構成されるデッキを生成する
    def generate_deck
      deck = []
      Card::SUITS.each do |suit|
        Card::VALUES.each do |value|
          deck << Card.new(suit, value)
        end
      end
      deck
    end
  end
end
