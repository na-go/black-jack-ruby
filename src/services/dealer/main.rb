module Blackjack
  class Dealer
    attr_reader :hand

    def initialize
      @hand = Hand.new
    end

    # カードをさらに引くかどうかを決定する
    def decide
      hand.total_value < 17
    end
  end
end
