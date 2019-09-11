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

      ace_high_unranked: Hand.new([
        Card.new(Rank.seven, Suit.clubs),
        Card.new(Rank.eight, Suit.clubs),
        Card.new(Rank.two, Suit.clubs),
        Card.new(Rank.ace, Suit.spades),
        Card.new(Rank.king, Suit.diamonds)
      ])
    ]
  end

  test "it ranks a high card hand", context do
    assert Hand.rank(context.ace_high) == HandRank.high_card
  end

  test "it turns a hand into a string", context do
    assert Hand.to_string(context.ace_high) == "A♤ K♢ 8♧ 7♧ 2♧"
  end  

  test "it turns an unranked hand into a string", context do
    assert Hand.to_string(context.ace_high_unranked) == "A♤ K♢ 8♧ 7♧ 2♧"
  end  

end
