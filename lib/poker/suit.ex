defmodule Suit do

  defstruct suit: nil

  @values [ spades: 4, hearts: 3, clubs: 2, diamonds: 1 ]
  @strings [ spades: "♤", hearts: "♡", clubs: "♧", diamonds: "♢" ]

  def spades(), do: to_struct(:spades)
  def hearts(), do: to_struct(:hearts)
  def clubs(), do: to_struct(:clubs)
  def diamonds(), do: to_struct(:diamonds)

  def compare(a, b) do
    cond do
      to_value(a) > to_value(b) -> :gt
      to_value(a) == to_value(b) -> :eq
      to_value(a) < to_value(b) -> :lt
    end
  end

  def to_string(%Suit{suit: suit}), do: @strings[suit]

  defp to_struct(suit), do: %Suit{ suit: suit }

  defp to_value(suit) do
    %Suit{suit: suit} = suit
    @values[suit]
  end

end
