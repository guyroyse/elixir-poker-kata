defmodule HandTest do
  use ExUnit.Case

  setup do
    [ 
      ace_high: Hand.new([
        Card.new(Rank.ace, Suit.spades),
        Card.new(Rank.king, Suit.diamonds),
        Card.new(Rank.eight, Suit.clubs),
        Card.new(Rank.seven, Suit.clubs),
        Card.new(Rank.two, Suit.clubs)
      ]),

      pair_of_aces: Hand.new([
        Card.new(Rank.ace, Suit.spades),
        Card.new(Rank.ace, Suit.diamonds),
        Card.new(Rank.eight, Suit.clubs),
        Card.new(Rank.seven, Suit.clubs),
        Card.new(Rank.two, Suit.clubs)
      ]),

      unranked: Hand.new([
        Card.new(Rank.seven, Suit.clubs),
        Card.new(Rank.eight, Suit.clubs),
        Card.new(Rank.two, Suit.clubs),
        Card.new(Rank.ace, Suit.spades),
        Card.new(Rank.king, Suit.diamonds)
      ])
    ]
  end

  test "it ranks a high card", context do
    assert Hand.rank(context.ace_high) == HandRank.high_card
  end

  test "it ranks a pair", context do
    assert Hand.rank(context.pair_of_aces) == HandRank.pair
  end

  test "it turns an unranked hand into a string", context do
    assert Hand.to_string(context.unranked) == "A♤ K♢ 8♧ 7♧ 2♧"
  end  

end
