defmodule Rank do

  defstruct rank: nil

  @values [
    ace: 14, king: 13, queen: 12, jack: 11, ten: 10,
    nine: 9, eight: 8, seven: 7, six: 6, five: 5,
    four: 4, three: 3, two: 2
  ]

  @strings [
    ace: "A", king: "K", queen: "Q", jack: "J", ten: "10",
    nine: "9", eight: "8", seven: "7", six: "6", five: "5",
    four: "4", three: "3", two: "2"
  ]

  def ace(), do: to_struct(:ace)
  def king(), do: to_struct(:king)
  def queen(), do: to_struct(:queen)
  def jack(), do: to_struct(:jack)
  def ten(), do: to_struct(:ten)
  def nine(), do: to_struct(:nine)
  def eight(), do: to_struct(:eight)
  def seven(), do: to_struct(:seven)
  def six(), do: to_struct(:six)
  def five(), do: to_struct(:five)
  def four(), do: to_struct(:four)
  def three(), do: to_struct(:three)
  def two(), do: to_struct(:two)

  def compare(a, b) do
    cond do
      to_value(a) > to_value(b) -> :gt
      to_value(a) == to_value(b) -> :eq
      to_value(a) < to_value(b) -> :lt
    end
  end

  def to_string(%Rank{rank: rank}), do: @strings[rank]

  defp to_struct(rank), do: %Rank{ rank: rank }

  defp to_value(rank) do
    %Rank{rank: rank} = rank
    @values[rank]
  end

end
