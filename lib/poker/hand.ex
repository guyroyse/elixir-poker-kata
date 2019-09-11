defmodule Hand do

  defstruct cards: []

  def new([%Card{}, %Card{}, %Card{}, %Card{}, %Card{}] = cards) do
    %Hand{ cards: cards }
  end

  def rank(%Hand{} = hand) do
    HandRank.high_card
  end

  def to_string(%Hand{} = hand) do
    hand.cards
    |> Enum.sort(&(Card.compare(&1, &2) == :gt))
    |> Enum.map(&(Card.to_string(&1)))
    |> Enum.join(" ")
  end

end
