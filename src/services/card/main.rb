module Blackjack
  class Card
    attr_reader :suit, :value

    SUITS = %w[Hearts Diamonds Clubs Spades].freeze
    VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

    def initialize(suit, value)
      @suit = suit
      @value = value
    end

    # カードの文字列表現を返す
    def to_s
      "#{@value} of #{@suit}"
    end

    # カードの数値表現を返す
    def point_value
      return 10 if %w[J Q K].include?(@value)
      return 1 if @value == 'A'  # ステップ1ではAは1点として扱います
      @value.to_i
    end
  end
end
