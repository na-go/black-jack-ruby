require 'minitest/autorun'
require_relative './main.rb'
require_relative '../card/main'
require_relative '../hand/main'
require 'stringio'

module Blackjack
  class PlayerTest < Minitest::Test
    def setup
      @player = Player.new
      @card1 = Card.new('Hearts', '7')
      @card2 = Card.new('Clubs', '8')
    end

    def test_decide
      simulate_user_input('Y') do
        assert @player.decide
      end

      simulate_user_input('N') do
        refute @player.decide
      end
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