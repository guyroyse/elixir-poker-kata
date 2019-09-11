defmodule Rank do

  @ranks [
    ace: 14, king: 13, queen: 12, jack: 11, ten: 10,
    nine: 9, eight: 8, seven: 7, six: 6, five: 5,
    four: 4, three: 3, two: 2
  ]

  def ace(), do: :ace
  def king(), do: :king
  def queen(), do: :queen
  def jack(), do: :jack
  def ten(), do: :ten
  def nine(), do: :nine
  def eight(), do: :eight
  def seven(), do: :seven
  def six(), do: :six
  def five(), do: :five
  def four(), do: :four
  def three(), do: :three
  def two(), do: :two

  def compare(a, b) do
    cond do
      @ranks[a] > @ranks[b] -> :gt
      @ranks[a] == @ranks[b] -> :eq
      @ranks[a] < @ranks[b] -> :lt
    end
  end

  def to_string(:ace), do: "A"
  def to_string(:king), do: "K"
  def to_string(:queen), do: "Q"
  def to_string(:jack), do: "J"
  def to_string(:ten), do: "10"
  def to_string(:nine), do: "9"
  def to_string(:eight), do: "8"
  def to_string(:seven), do: "7"
  def to_string(:six), do: "6"
  def to_string(:five), do: "5"
  def to_string(:four), do: "4"
  def to_string(:three), do: "3"
  def to_string(:two), do: "2"

end
