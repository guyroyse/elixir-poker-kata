defmodule Hand do

  defstruct cards: []

  def new([%Card{}, %Card{}, %Card{}, %Card{}, %Card{}] = cards) do
    %Hand{ cards: cards }
  end

  def rank(%Hand{} = hand) do
    cond do
      is_five_of_a_kind?(hand.cards) -> HandRank.five_of_a_kind
      is_four_of_a_kind?(hand.cards) -> HandRank.four_of_a_kind
      is_full_house?(hand.cards) -> HandRank.full_house
      is_straight?(hand.cards) -> HandRank.straight
      is_three_of_a_kind?(hand.cards) -> HandRank.three_of_a_kind
      is_two_pair?(hand.cards) -> HandRank.two_pair
      is_pair?(hand.cards) -> HandRank.pair
      is_high_card?(hand.cards) -> HandRank.high_card
    end
  end

  defp is_five_of_a_kind?(cards), do: RankCounter.count_quints(cards) == 1
  defp is_four_of_a_kind?(cards), do: RankCounter.count_quads(cards) == 1
  defp is_full_house?(cards), do: RankCounter.count_triples(cards) == 1 &&
    RankCounter.count_pairs(cards) == 1

  defp is_straight?(cards) do
    card_values = 
      cards
      |> Enum.map(fn card -> Rank.to_value(card.rank) end)

    full_size =
      card_values
      |> Enum.count()

    uniq_size = 
      card_values
      |> Enum.uniq()
      |> Enum.count()

    { min, max } =
      card_values
      |> Enum.min_max()

    (max - min + 1 == full_size) && (full_size == uniq_size)
  end

  defp is_three_of_a_kind?(cards), do: RankCounter.count_triples(cards) == 1
  defp is_two_pair?(cards), do: RankCounter.count_pairs(cards) == 2
  defp is_pair?(cards), do: RankCounter.count_pairs(cards) == 1
  defp is_high_card?(_), do: true

  def to_string(%Hand{} = hand) do
    hand.cards
    |> Enum.sort(&(Card.compare(&1, &2) == :gt))
    |> Enum.map(&(Card.to_string(&1)))
    |> Enum.join(" ")
  end

end

defmodule RankCounter do

  def count_pairs(cards), do: count_matches(cards, 2)
  def count_triples(cards), do: count_matches(cards, 3)
  def count_quads(cards), do: count_matches(cards, 4)
  def count_quints(cards), do: count_matches(cards, 5)

  def count_matches(cards, size) do
    cards
    |> just_the_ranks()
    |> count_the_ranks()
    |> just_the_matches_by_size(size)
    |> Enum.count()
  end

  def just_the_ranks(cards) do
    cards
    |> Enum.map(fn card -> card.rank.rank end)
  end

  def count_the_ranks(cards) do
    cards
    |> Enum.group_by(&(&1))
    |> Enum.map(fn { rank, cards } -> { rank, Enum.count(cards) } end)
    |> Enum.into(%{})
  end

  def just_the_matches_by_size(histogram, size) do
    histogram
    |> Enum.filter(fn { _rank, count } -> count == size end)
  end

end
