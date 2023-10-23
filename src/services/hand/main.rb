module Blackjack
  class Hand
    attr_reader :cards

    def initialize
      @cards = []
    end

    # カードを手札に追加する
    def add_card(card)
      @cards << card
    end

    # 手札の合計値を計算する
    # 手札の合計値を計算する
    def total_value
      total = 0
      aces = 0

      @cards.each do |card|
        total += card.point_value
        aces += 1 if card.value == 'A'
      end

      # Aの値を1または11として扱う
      while aces > 0 && total <= 11
        total += 10
        aces -= 1
      end

      total
    end
  end
end
