defmodule HandRank do

  defstruct rank: nil

  @values [
    five_of_a_kind: 11,
    royal_flush: 10,
    straight_flush: 9,
    four_of_a_kind: 8,
    full_house: 7,
    flush: 6,
    straight: 5,
    three_of_a_kind: 4,
    two_pair: 3,
    pair: 2,
    high_card: 1
  ]

  @strings [
    five_of_a_kind: "Five of a Kind",
    royal_flush: "Royal Flush",
    straight_flush: "Straight Flush",
    four_of_a_kind: "Four of a Kind",
    full_house: "Full House",
    flush: "Flush",
    straight: "Straight",
    three_of_a_kind: "Three of a Kind",
    two_pair: "Two Pair",
    pair: "Pair",
    high_card: "High Card"
  ]

  def five_of_a_kind(), do: to_struct(:five_of_a_kind)
  def royal_flush(), do: to_struct(:royal_flush)
  def straight_flush(), do: to_struct(:straight_flush)
  def four_of_a_kind(), do: to_struct(:four_of_a_kind)
  def full_house(), do: to_struct(:full_house)
  def flush(), do: to_struct(:flush)
  def straight(), do: to_struct(:straight)
  def three_of_a_kind(), do: to_struct(:three_of_a_kind)
  def two_pair(), do: to_struct(:two_pair)
  def pair(), do: to_struct(:pair)
  def high_card(), do: to_struct(:high_card)

  def compare(a, b) do
    cond do
      to_value(a) > to_value(b) -> :gt
      to_value(a) == to_value(b) -> :eq
      to_value(a) < to_value(b) -> :lt
    end
  end

  def to_string(%HandRank{rank: rank}), do: @strings[rank]

  defp to_struct(rank), do: %HandRank{ rank: rank }

  defp to_value(rank) do
    %HandRank{rank: rank} = rank
    @values[rank]
  end

end
