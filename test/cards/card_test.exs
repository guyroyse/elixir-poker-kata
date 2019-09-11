defmodule CardTest do
  use ExUnit.Case

  test "it compares cards that are greater than by rank and greater than by suit" do
    a = Card.new(Rank.king, Suit.spades)
    b = Card.new(Rank.queen, Suit.diamonds)
    assert Card.compare(a, b) == :gt
  end

  test "it compares cards that are greater than by rank and equal by suit" do
    a = Card.new(Rank.jack, Suit.diamonds)
    b = Card.new(Rank.ten, Suit.diamonds)
    assert Card.compare(a, b) == :gt
  end

  test "it compares cards that are greater than by rank and less than by suit" do
    a = Card.new(Rank.jack, Suit.diamonds)
    b = Card.new(Rank.ten, Suit.spades)
    assert Card.compare(a, b) == :gt
  end

  test "it compares cards that are equal by rank and greater than by suit" do
    a = Card.new(Rank.queen, Suit.spades)
    b = Card.new(Rank.queen, Suit.diamonds)
    assert Card.compare(a, b) == :gt
  end
 
  test "it compares cards that are equal by rank and equal by suit" do
    a = Card.new(Rank.ace, Suit.spades)
    b = Card.new(Rank.ace, Suit.spades)
    assert Card.compare(a, b) == :eq
  end

  test "it compares cards that are equal by rank but less than by suit" do
    a = Card.new(Rank.five, Suit.diamonds)
    b = Card.new(Rank.five, Suit.spades)
    assert Card.compare(a, b) == :lt
  end

  test "it compares cards that are less than by rank and greater than by suit" do
    a = Card.new(Rank.ten, Suit.hearts)
    b = Card.new(Rank.jack, Suit.diamonds)
    assert Card.compare(a, b) == :lt
  end
  
  test "it compares cards that are less than by rank and equal by suit" do
    a = Card.new(Rank.ten, Suit.diamonds)
    b = Card.new(Rank.jack, Suit.diamonds)
    assert Card.compare(a, b) == :lt
  end

  test "it compares cards that are less than by rank and less than by suit" do
    a = Card.new(Rank.ten, Suit.clubs)
    b = Card.new(Rank.jack, Suit.diamonds)
    assert Card.compare(a, b) == :lt
  end

  test "it turns cards into strings" do
    assert "7♧" = Card.new(Rank.seven, Suit.clubs)
    |> Card.to_string()
  end

end
