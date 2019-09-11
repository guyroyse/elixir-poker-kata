defmodule Hand do

  defstruct cards: []

  def new([%Card{}, %Card{}, %Card{}, %Card{}, %Card{}] = cards) do
    %Hand{ cards: cards }
  end

  def rank(%Hand{} = hand) do
    cond do
      is_pair?(hand.cards) -> HandRank.pair
      is_high_card?(hand.cards) -> HandRank.high_card
    end
  end

  defp is_pair?(cards) do
    cards
    |> Enum.map(&(&1.rank))
    |> Enum.group_by(&(&1))
    |> Enum.map(fn { _, cards } -> Enum.count(cards) end)
    |> Enum.member?(2)
  end

  defp is_high_card?(_) do
    true
  end

  def to_string(%Hand{} = hand) do
    hand.cards
    |> Enum.sort(&(Card.compare(&1, &2) == :gt))
    |> Enum.map(&(Card.to_string(&1)))
    |> Enum.join(" ")
  end

end
