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

      two_pair_aces_and_eights: Hand.new([
        Card.new(Rank.ace, Suit.spades),
        Card.new(Rank.ace, Suit.diamonds),
        Card.new(Rank.eight, Suit.clubs),
        Card.new(Rank.eight, Suit.hearts),
        Card.new(Rank.two, Suit.clubs)
      ]),

      three_kings: Hand.new([
        Card.new(Rank.king, Suit.spades),
        Card.new(Rank.king, Suit.diamonds),
        Card.new(Rank.king, Suit.clubs),
        Card.new(Rank.seven, Suit.clubs),
        Card.new(Rank.two, Suit.clubs)
      ]),

      full_house: Hand.new([
        Card.new(Rank.king, Suit.spades),
        Card.new(Rank.king, Suit.diamonds),
        Card.new(Rank.king, Suit.clubs),
        Card.new(Rank.two, Suit.hearts),
        Card.new(Rank.two, Suit.clubs)
      ]),

      four_ladys: Hand.new([
        Card.new(Rank.queen, Suit.spades),
        Card.new(Rank.queen, Suit.diamonds),
        Card.new(Rank.queen, Suit.clubs),
        Card.new(Rank.queen, Suit.hearts),
        Card.new(Rank.two, Suit.clubs)
      ]),

      five_aces: Hand.new([
        Card.new(Rank.ace, Suit.spades),
        Card.new(Rank.ace, Suit.diamonds),
        Card.new(Rank.ace, Suit.clubs),
        Card.new(Rank.ace, Suit.hearts),
        Card.new(Rank.ace, Suit.clubs)
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

  test "it ranks two pair", context do
    assert Hand.rank(context.two_pair_aces_and_eights) == HandRank.two_pair
  end

  test "it ranks three of a kinda", context do
    assert Hand.rank(context.three_kings) == HandRank.three_of_a_kind
  end

  test "it ranks a full house", context do
    assert Hand.rank(context.full_house) == HandRank.full_house
  end

  test "it ranks four of a kinda", context do
    assert Hand.rank(context.four_ladys) == HandRank.four_of_a_kind
  end

  test "it ranks five of a kinda", context do
    assert Hand.rank(context.five_aces) == HandRank.five_of_a_kind
  end

  test "it turns an unranked hand into a string", context do
    assert Hand.to_string(context.unranked) == "A♤ K♢ 8♧ 7♧ 2♧"
  end  

end
