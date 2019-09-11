defmodule Suit do

  @suits [spades: 4, hearts: 3, clubs: 2, diamonds: 1]

  def spades(), do: :spades
  def hearts(), do: :hearts
  def clubs(), do: :clubs
  def diamonds(), do: :diamonds

  def compare(a, b) do
    cond do
      @suits[a] > @suits[b] -> :gt
      @suits[a] == @suits[b] -> :eq
      @suits[a] < @suits[b] -> :lt
    end
  end

  def to_string(:spades), do: "♠︎"
  def to_string(:hearts), do: "♥"
  def to_string(:clubs), do: "♣︎"
  def to_string(:diamonds), do: "♦"

end
