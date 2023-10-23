module Blackjack
  class Player
    attr_reader :hand

    def initialize
      @hand = Hand.new
    end

    # カードをさらに引くかどうかを決定する
    def decide
      print "あなたの現在の得点は#{hand.total_value}です。カードを引きますか？（Y/N）: "
      user_input = gets.chomp.upcase
      user_input == 'Y'
    end
  end
end
