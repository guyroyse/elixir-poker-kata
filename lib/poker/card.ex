defmodule Card do

  defstruct rank: nil, suit: nil

  def new(%Rank{} = rank, %Suit{} = suit) do
    %Card{ rank: rank, suit: suit }
  end

  def compare(%Card{} = a, %Card{} = b) do
    rank = Rank.compare(a.rank, b.rank)
    suit = Suit.compare(a.suit, b.suit)
    case { rank, suit } do
      { :eq, n } -> n
      { n, _ } -> n
    end
  end

  def to_string(%Card{} = card) do
    Rank.to_string(card.rank) <> Suit.to_string(card.suit)
  end

end
